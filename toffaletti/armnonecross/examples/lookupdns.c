/*
 * Portions created by SGI are Copyright (C) 2000 Silicon Graphics, Inc.
 * All Rights Reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of Silicon Graphics, Inc. nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDERS AND CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 * TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include "st.h"
#include "res.h"
#include"sc_log.h"

#if !defined(NETDB_INTERNAL) && defined(h_NETDB_INTERNAL)
#define NETDB_INTERNAL h_NETDB_INTERNAL
#endif

/* Resolution timeout (in microseconds) */
#define NUM (4) /*FROM 2 TO 5 FOR TEST BY ME 20150922*/
#define TIMEOUT (NUM*1000000LL)


static void *do_resolve(void *hostname)
{

	slogi("do_resolve hostname[%s]",hostname);
	#if 0
	/*
[/home/st/toffaletti/armhf/key.c_114__st_thread_cleanup]key [110876]  key_max[0]
do_resolve hostname[www.baidu.com]
after strcpy  strcpy(host,hostname)[www.baidu.com] hostname[www.baidu.com]
[/home/st/toffaletti/armhf/event.c_421__st_select_fd_new]_st_select_fd_new osfd[7] ok
[/home/st/toffaletti/armhf/io.c_749_st_sendto]sendto get n [31]
[/home/st/toffaletti/armhf/io.c_730_st_recvfrom]recvfrom get n [90]
[/home/st/toffaletti/armhf/examples/res.c_278_dns_getaddr]query_domain return 0
[/home/st/toffaletti/armhf/io.c_212_st_netfd_close]JUST TEST st_netfd_close

Program received signal SIGSEGV, Segmentation fault.
0x00000000 in ?? ()
(gdb) bt
#0  0x00000000 in ?? ()
#1  0x0000b06e in dns_getaddr (
    host=<error reading variable: Cannot access memory at address 0xc>,
    addr=<error reading variable: Cannot access memory at address 0x8>,
    timeout=<error reading variable: Cannot access memory at address 0x0>)
    at /home/st/toffaletti/armhf/examples/res.c:281
Backtrace stopped: previous frame inner to this frame (corrupt stack?)
(gdb)
	*/
	char host[128];
	memset(host,0,128);
	//strcpy(host,hostname);
	slogi("after strcpy  strcpy(host,hostname)[%s] hostname[%s]",strcpy(host,hostname),hostname);
	#else
	char *host=malloc(128);
	memset(host,0,128);
	slogi("sizeof(hostname)[%d] strlen(hostname)[%d]",sizeof(hostname),strlen(hostname));
	memcpy(host,hostname,strlen(hostname)+1);
	slogi("host is [%s]",host);
	#endif

  struct in_addr addr;

#if 1
  /* Use dns_getaddr() instead of gethostbyname(3) to get IP address */
  #if 1
    int ret=-99;
     dns_getaddr(host, &addr, TIMEOUT);
    LOGD("dns_getaddr RET");
    if ( ret< 0) {
  #else
    if ( dns_getaddr(host, &addr, TIMEOUT)< 0) {
  #endif
// #endif
  	/*PC上会输出小于0，tvbox上啥都没有输出啊*/
    fprintf(stderr, "dns_getaddr: can't resolve %s: ", (char *)host);
    if (h_errno == NETDB_INTERNAL)
      perror("");
    else
      herror("");
  } else /*这种情况就是找到了*/
      printf("%-40s %s\n", (char *)host, inet_ntoa(addr));
#else //直接测试线程函数
/* http://m.blog.chinaunix.net/uid-28595538-id-4923606.html
inet_ntoa 函数 API 描述
#include
#include
char * inet_ntoa( struct in_addr_in ) ;

参数：
   in : 该参数存放用来转换的16进制网络顺序的IP地址结构体
返回值：
   如果函数 Inet_ntoa 成功将 16进制网络顺序的 IP地址转换为字符串类型的点分IP 地址，
   则将该字符串作为返回值返回，转换失败，返回 NULL

*/
	int count=20;
	while(count--)
    {
		LOGD("just for test thread func ....");
		//这里输出的addr是错误的
		printf("%-40s %s\n", (char *)host, inet_ntoa(addr));
	}
#endif
//20150923
   free(host);
  return NULL;
}


/*
 * Asynchronous DNS host name resolution. This program creates one
 * ST thread for each host name (specified as command line arguments).
 * All threads do host name resolution concurrently.
 */
int main(int argc, char *argv[])
{
	slogi("argc[%d]",argc);
  int i;

  if (argc < 2) {
    fprintf(stderr, "Usage: %s <hostname1> [<hostname2>] ...\n", argv[0]);
    exit(1);
  }

  if (st_init() < 0) {
    perror("st_init");
    exit(1);
  }

	slogi("---before for--argc[%d]",argc);
  for (i = 1; i < argc; i++) {
  	slogi("====%d=[%s]=",i,argv[i]);
    /* Create a separate thread for each host name */
    if (st_thread_create(do_resolve, argv[i], 0, 0) == NULL) {
      perror("st_thread_create");
      exit(1);
    }
  }

  st_thread_exit(NULL); //怎么直接到了这里呢

  /* NOTREACHED 网络不可达� */
  return 1; //貌似这里是成功?
}

