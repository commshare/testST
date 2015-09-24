/*
 * dns.c Copyright 1999 Christopher M Sedore. All Rights Reserved.
 * Please see the "COPYING" file for license details.
 *
 * This file contains functions to fork a separate process to
 * periodically update DNS information for other sites.
 *
 * These functions have not been thoroughly tested.
 */

#include "sc_unrelay_main.h"
#include <netdb.h>
#include <sys/ipc.h>
#include <sys/sem.h>

#define MAX_DNS 2048

struct dns_entry {
	char name[255];
	unsigned int addrs[64];
	int naddrs;
	int refCount;
	int nextUpdate;
	int reverse;
	int laddr;
	int inUpdate;
};

int * volatile dnsEntriesInUse;

struct dns_entry *dnsArray;

int dnsSem;

#ifndef STDEBUG
extern time_t curtime;
#else
time_t curtime;
#endif

void
Update(struct dns_entry *d)
{
	struct hostent *he;
	int x;


	if (d->reverse) {
		he=gethostbyaddr((char *)&d->addrs[0],4,AF_INET);
		if (he) {
			strcpy(d->name,he->h_name);
		}
		printf("update %s\n",d->name);
	} else {
		he=gethostbyname(d->name);
		if (he) {
			x=0;
			while (he->h_addr_list[x]) {
				d->addrs[x]=*(int *)he->h_addr_list[x];
				if (x>64) break;
				x++;
			}
			d->naddrs=x;
			printf("update %s (%i)\n",d->name,x);
			d->laddr=0;
			d->nextUpdate=curtime+1800;
		}
	}
}


void
DnsWalk()
{
	int x,y,z;
	struct hostent *he;
	struct sembuf sembl,sembul;

	sembl.sem_num=0;
	sembl.sem_op=-1;
	sembl.sem_flg=0;
	sembul.sem_num=0;
	sembul.sem_op=1;
	sembul.sem_flg=0;

	while (1) {
//		printf("walk %i\n",getpid());
		y=0; x=0;
		z=*dnsEntriesInUse;
		while (y<z) {
			if (dnsArray[x].refCount) {
//				printf("%i found %s <----------------------------------------------\n",curtime,dnsArray[x].name);
				y++;
				if (dnsArray[x].nextUpdate<curtime) {
					semop(dnsSem,&sembl,1);
					if (!dnsArray[x].inUpdate) {
						dnsArray[x].inUpdate=1;
						semop(dnsSem,&sembul,1);

						Update(&dnsArray[x]);

						semop(dnsSem,&sembl,1);
						dnsArray[x].inUpdate=0;
					}
					semop(dnsSem,&sembul,1);
				}
			}
			x++;
		}
		sleep(5);
	}
}

void
DnsAddName(char *name)
{
	int x=0,y=0,z=-1;

	while (y<*dnsEntriesInUse) {
		if (dnsArray[x].refCount) {
			y++;
			if (!strcmp(dnsArray[x].name,name)) {
				dnsArray[x].refCount++;
				return;
			}
		} else if (z==-1) z=x;
		x++;
	}

	if (z==-1) z=*dnsEntriesInUse;
	bzero(&dnsArray[z],sizeof(struct dns_entry));
	strcpy(dnsArray[z].name,name);
	if (inet_aton(name,&dnsArray[z].addrs[0])) {
		dnsArray[z].naddrs=1;
		dnsArray[z].nextUpdate=0x7FFFFFFF;
	} else {
		dnsArray[z].nextUpdate=0;
	}
	dnsArray[z].refCount=1;
	*dnsEntriesInUse=*dnsEntriesInUse + 1;
	printf("adding name %i,inuse=%i\n",z,*dnsEntriesInUse);
}

int
DnsGetAddr(char *name)
{
	int x=0,y=0;


//	printf("lookup %s: ",name);

	while (y<*dnsEntriesInUse) {
		if (dnsArray[x].refCount) {
			y++;
			if (!strcmp(dnsArray[x].name,name)) {
				if (dnsArray[x].naddrs==0)
					return 0;
				if (dnsArray[x].laddr>=
					dnsArray[x].naddrs)
					dnsArray[x].laddr=0;
//				printf("found %s\n",inet_ntoa(dnsArray[x].addrs[dnsArray[x].laddr]));
				return dnsArray[x].addrs[dnsArray[x].laddr++];
			}
		}
		x++;
	}
	printf("not found");
	return 0;
}

char *
DnsGetName(int addr)
{
	int x=0,y=0,z;

	while (y<*dnsEntriesInUse) {
		if (dnsArray[x].refCount) {
			y++;
			z=0;
		//printf("check %s,%u\n",dnsArray[x].name,dnsArray[x].naddrs);
			while (z<dnsArray[x].naddrs) {
				if (dnsArray[x].addrs[z]==addr) {
					return dnsArray[x].name;
				}
				z++;
			}
		}
		x++;
	}

	return NULL;
}


int
DnsInit()
{
	char *t;
	int numDnsProcs;

        dnsSem=semget(IPC_PRIVATE,1,SEM_A|SEM_R);

	semctl(dnsSem,0,SETVAL,1);

/*	dnsArray=malloc(sizeof(struct dns_entry)*MAX_DNS);

	curtime=1;

	t=malloc(1024*32);
	t+=16384;

	if (thrfork(RFPROC|RFMEM,t,thr_run,1,DnsWalk,0)) {
		return 0;
	} */


	curtime=1;

	t=mmap(NULL,16+(sizeof(struct dns_entry)*MAX_DNS),
			PROT_READ|PROT_WRITE,MAP_ANON|MAP_INHERIT|MAP_SHARED,
			-1,0);


	assert(t!=NULL);

	bzero(t,16+(sizeof(struct dns_entry)*MAX_DNS));

	dnsEntriesInUse=(int *)t;
	dnsArray=(struct dns_entry *)t+16;


	printf("FORKING\n");

	printf("WALKING\n");

	if (GetConfigInt("NumDnsProcesses",&numDnsProcs)==NULL) {
		numDnsProcs=4;
	}

	if ((numDnsProcs<1) || (numDnsProcs>50)) {
		numDnsProcs=4;
	}

	while (numDnsProcs--) {
		if (fork())
			continue;
		else {
			setproctitle("urelay DNS %i",numDnsProcs);
			DnsWalk();
		}
	}


	return 0;
}

#ifdef STDEBUG
int
main(int argc,char **argv)
{
	int x;

	DnsInit();
	perror("rfork");

	DnsAddName("static.maxwell.syr.edu");

	while (1) {
		x=DnsGetAddr("static.maxwell.syr.edu");
		if (x) break;
		sleep(5);
		time(&curtime);
	}

	exit(0);
}

#endif
