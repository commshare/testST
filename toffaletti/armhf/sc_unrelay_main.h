//main.h
/*
 * main.h Copyright 1999 Christopher M Sedore. All Rights Reserved.
 * Please see the "COPYING" file for license details.
 */
//http://www.mit.edu/afs.new/sipb/user/kolya/urelay/main.h

#include <sys/types.h>
#include <sys/time.h>
#include <sys/socket.h>
#include <sys/queue.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <aio.h>
#include <netinet/in.h>
#include <sys/ioctl.h>
#include <md5.h>
#include <sys/errno.h>
#include <assert.h>
#include <string.h>
#include <netinet/tcp.h>
#include <syslog.h>
//#include <varargs.h>

//#include <dmalloc.h>

//#include "mymalloc.h"

#include "config.h"

#define TRUE 1
#define FALSE 0

#define ARTENTRY_MAGIC 0xFEFEBAD1

#define ZeroMemory(x,y) bzero(x,y)
#define StringMatch(x,y) Tcl_StringMatch(x,y)

#define MAX_PATH 255
#define MAX_ARTICLEID 255

#define BASE_ARTSIZE 48*1024
#define MAX_ARTSIZE 1024*1024

#define MAX_FEEDS 192

#define NNTP_STREAMING 		0x01
#define NNTP_READ_ARTICLE 	0x02
#define NNTP_BAD_ARTICLE	0x04
#define NNTP_CLOSE_CONNECTION	0x08
#define NNTP_CLOSE_CONNECTION_AFTER_OP	0x10
#define NNTP_FEED_START		0x20
#define NNTP_FEED_CLOSE		0x40
#define NNTP_ASYNC_ACT		0x80
#define NNTP_BUF_COMPRESS	0x100


#define PERM_CONNECT		0x01000000
#define PERM_FEED		0x02000000
#define PERM_MAINT		0x04000000

#define NNTP_MAINTENANCE	0x00010000

#define CONTEXT_BUF_SIZE	8192

typedef struct _matchData {
	char *newsgroups;
	int numgroups;
	char *pathline;
	int hopcount;
	int followupCount;
} ARTICLEDATA;

struct article {
	char *buf;
	char *bufp;
	int len;
	time_t artTime;
	int isControl;
	int isApproved;
	int bufsz;
	int refcount;
	char mid[MAX_ARTICLEID+1];
	unsigned int distflags[MAX_FEEDS / 32];
	char filterResponse[6];
	ARTICLEDATA *ad;
};

struct myaiocb {
	struct aiocb cb;
	void (*callback)(void *,int);
	char *state;
	int logfd;
};

struct context {
	struct myaiocb cb;
	char buf[CONTEXT_BUF_SIZE],*bp;
	char obuf[CONTEXT_BUF_SIZE+1024];
	int buflen,obuflen,bufsz,obufsz;
	int (*callback)(struct context *);
	int (*errorCallback)(void *);
	int fd,connerror,connErrorCode;
	char *state;

	int cmdcount;
	int flags;
	char mid[MAX_ARTICLEID+1];
	struct article *art;
	u_quad_t mid64;
	struct incoming_entry *incoming;


	TAILQ_ENTRY(context) list;
	TAILQ_ENTRY(context) clist;
	struct artent *pae[32];
	struct osite *site;
	int outstanding,lastbatch;
	u_quad_t key;
	int artlen;
	void *hold;
};



int NntpMain(struct context *cc);

#define CONSUMER_REJECT		439
#define CONSUMER_IGNORE		551
#define CONSUMER_OK		239

struct artconsumer {
	TAILQ_ENTRY(artconsumer) next;
	void *dist;
	int (*callback)(struct article *art);
};

#include "distributions.h"


struct artent {
	unsigned int magic;
	unsigned short length;
	unsigned int siteflags[MAX_FEEDS / 32];
	u_quad_t key;
	int artlen;
	unsigned int serial;
	char mid[1];
};

struct incoming_entry {
	char name[200];
	int rights;
	int mark;

	char *diststr;
	void *dist;

	int accept,refuse,reject,error;
	int connected,maxConnections;

	TAILQ_ENTRY(incoming_entry) list;
	TAILQ_HEAD(actch,context) activeConns;
};


#define FLAG_FOR_CONNECTION_CLOSE(c) {c->flags|=NNTP_CLOSE_CONNECTION; printf("closing at %s, %i\n",__FILE__,__LINE__); }
#define FLAG_FOR_CONNECTION_CLOSE_AOP(c) {c->flags|=NNTP_CLOSE_CONNECTION; printf("closing at %s, %i\n",__FILE__,__LINE__); }

int AddPrecommit(u_quad_t hash);
int AddSeen(u_quad_t id, unsigned int unused);
unsigned int CheckSeen(u_quad_t id);

int NntpMain(struct context *);
int FeedMain(struct context *);
u_quad_t HashArticleID(char *mid,int length);

void *MapFromStore(u_quad_t key,int len);
int UnMapStore(void *addr, int len);
int WriteToStore(int store,u_quad_t *key,struct myaiocb *cb);
int DecipherKey(u_quad_t key, int *store, off_t *offset);
int GetFromStore(u_quad_t key,struct myaiocb *cb);
u_quad_t GetStoreKey(int store);

struct incoming_entry *IncomingCheck(int);

int GetPrecommitArtEnt(u_quad_t hash, struct artent *ae);
int UpdatePrecommit(u_quad_t hash, struct artent *ae);

