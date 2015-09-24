/*
 * Copyright (c) 1985, 1988, 1993
 *    The Regents of the University of California.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *      This product includes software developed by the University of
 *      California, Berkeley and its contributors.
 * 4. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
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

#if defined (DARWIN)
#define BIND_8_COMPAT
#endif

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/nameser.h>
#include <resolv.h>
#include <netdb.h>
#include <errno.h>
#include "st.h"

#include "res.h"
#include"sc_log.h"

#define MAXPACKET 1024

#if !defined(NETDB_INTERNAL) && defined(h_NETDB_INTERNAL)
#define NETDB_INTERNAL h_NETDB_INTERNAL
#endif

/* New in Solaris 7 */
#if !defined(_getshort) && defined(ns_get16)
#define _getshort(cp) ns_get16(cp)
#elif !defined(_getshort)
extern int _getshort(unsigned char *);
#endif

typedef union {
    HEADER hdr;
    u_char buf[MAXPACKET];
} querybuf_t;


static int parse_answer(querybuf_t *ans, int len, struct in_addr *addr)
{
  char buf[MAXPACKET];
  HEADER *ahp;
  u_char *cp, *eoa;
  int type, n;

  ahp = &ans->hdr;
  eoa = ans->buf + len;
  cp = ans->buf + sizeof(HEADER);

  while (ahp->qdcount > 0) { //要执行
    ahp->qdcount--;
    cp += dn_skipname(cp, eoa) + QFIXEDSZ;
  }
  while (ahp->ancount > 0 && cp < eoa) {//要执行
    ahp->ancount--;
    if ((n = dn_expand(ans->buf, eoa, cp, buf, sizeof(buf))) < 0)
      break;
    cp += n;
    type = _getshort(cp);
    cp += 8;
    n = _getshort(cp);
    cp += 2;
    if (type == T_CNAME) {
      cp += n;
      continue;
    }
    memcpy(addr, cp, n);
    return 0; //走这里
  }

  h_errno = TRY_AGAIN;
  return -1;
}


static int query_domain(st_netfd_t nfd, const char *name, struct in_addr *addr,
			st_utime_t timeout)
{
 //	name="www.baidu.com";
#if 0
  char *name=malloc(128);
  memset(name,0,128);
  strcpy(name,hostname);
 LOGD("hostname [%s] name[%s]",hostname,name);
#endif
  querybuf_t qbuf;
  u_char *buf = qbuf.buf;
  HEADER *hp = &qbuf.hdr;
  int blen = sizeof(qbuf);
  int i, len, id;

  for (i = 0; i < _res.nscount; i++) {
    len = res_mkquery(QUERY, name, C_IN, T_A, NULL, 0, NULL, buf, blen);
    if (len <= 0) {
      h_errno = NO_RECOVERY;
      return -1;
    }
    id = hp->id;

    if (st_sendto(nfd, buf, len, (struct sockaddr *)&(_res.nsaddr_list[i]),
		  sizeof(struct sockaddr), timeout) != len) {
      h_errno = NETDB_INTERNAL;
      /* EINTR means interrupt by other thread, NOT by a caught signal */
      if (errno == EINTR)
	return -1;
      continue;
    }

 len = st_recvfrom(nfd, buf, blen, NULL, NULL, timeout);
 	LOGD("  st_recvfrom len[%d]",len);
return 0;




    /* Wait for reply */
    do {
      len = st_recvfrom(nfd, buf, blen, NULL, NULL, timeout);
      if (len <= 0) /*一直接收不到应答消息啊*/
	  {
	  	LOGD("  st_recvfrom len[%d]",len);
	  	break;
	  }
    } while (id != hp->id);

    if (len < HFIXEDSZ) {
      h_errno = NETDB_INTERNAL;
      if (len >= 0)
	errno = EMSGSIZE;
      else if (errno == EINTR)  /* see the comment above */
	return -1;
      continue;
    }

    hp->ancount = ntohs(hp->ancount);
    hp->qdcount = ntohs(hp->qdcount);
    if ((hp->rcode != NOERROR) || (hp->ancount == 0)) {
      switch (hp->rcode) {
      case NXDOMAIN:
	h_errno = HOST_NOT_FOUND;
	break;
      case SERVFAIL:
	h_errno = TRY_AGAIN;
	break;
      case NOERROR: /*走这里*/
	h_errno = NO_DATA;
	break;
      case FORMERR:
      case NOTIMP:
      case REFUSED:
      default: /*走这里*/
	h_errno = NO_RECOVERY;
      }
      continue;
    }

    if (parse_answer(&qbuf, len, addr) == 0)
    {	LOGD("after parse_answer");
	//free(name);//add by me for malloc
		return 0;//走这里
    }
  }
 ///free(name);//add by me 20150923
  return -1;
}


#define CLOSE_AND_RETURN(ret) \
  { \
  	printf("ret[%d] errno[%d]",ret,errno);\
    n = errno;                \
    st_netfd_close(nfd);      \
    errno = n;                \
    return (ret);             \
  }


int dns_getaddr(const char *hosttest, struct in_addr *addr, st_utime_t timeout)
{
	//return 0;
//	host="www.baidu.com";
#if 0
char *host=malloc(128);
memset(host,0,128);
strcpy(host,hosttest);
#endif
char host[128];
memset(host,0,128);
strcpy(host,hosttest);
LOGD("hosttest [%s] host[%s]",hosttest,host);

  char name[MAXDNAME], **domain;
  const char *cp;
  int s, n, maxlen, dots;
  int trailing_dot, tried_as_is;
  st_netfd_t nfd;

  if ((_res.options & RES_INIT) == 0 && res_init() == -1) {
    h_errno = NETDB_INTERNAL;
    return -1;
  }
  if (_res.options & RES_USEVC) {
    h_errno = NETDB_INTERNAL;
    errno = ENOSYS;
    return -1;
  }
  if (!host || *host == '\0') {
    h_errno = HOST_NOT_FOUND;
    return -1;
  }

  /* Create UDP socket */
  if ((s = socket(PF_INET, SOCK_DGRAM, 0)) < 0) {
    h_errno = NETDB_INTERNAL;
    return -1;
  }
  if ((nfd = st_netfd_open_socket(s)) == NULL) {
    h_errno = NETDB_INTERNAL;
    n = errno; //n用来记录错误号
    close(s);
    errno = n;
    return -1;
  }
  //可以走到这里
  maxlen = sizeof(name) - 1;
  LOGD("maxlen[%d]",maxlen);
  n = 0; //此时n是计数器
  dots = 0;
  trailing_dot = 0;
  tried_as_is = 0;

  for (cp = host; *cp && n < maxlen; cp++) {
  	//dots记录host中有几个.
    dots += (*cp == '.'); //走这里
    name[n++] = *cp; //看起来好像是复制host到name中
  }
  //n是后加，所以n-1，此时n-1对应的是最后一个字符
  if (name[n - 1] == '.')
    trailing_dot = 1;
  LOGD("========AAA===name[%s]=========",name);
  /*
   * If there are dots in the name already, let's just give it a try
   * 'as is'.  The threshold can be set with the "ndots" option.
   */



  if (dots >= _res.ndots) {
    if (query_domain(nfd, host, addr, timeout) == 0)
    {
		/*貌似我的query域名就是返回0，只好关闭并且退出了*/
	//	LOGD("query_domain return 0");
     /*不管我是否注释掉这句话都有段错误*/

		return 0;
#if 0
		CLOSE_AND_RETURN(0);
#else
     int ret=0;
     LOGD("===BB==========");
    // LOGD("%-40s %s", (char *)host, inet_ntoa(addr));
    // LOGD("DO RETURN ret[%d]",ret);

  	//LOGD(" errno[%d]",errno);
   // n = errno;
   // st_netfd_close(nfd);
  //  errno = n;
    return -1;
//  goto ZBTEST;
#endif
		//下面这句话不被执行，上面的return直接退出了这个函数
		slogi("query_domain WILL NOT HERE");
    }
    if (h_errno == NETDB_INTERNAL && errno == EINTR)
      CLOSE_AND_RETURN(-1);
    tried_as_is = 1;
  }

  /*
   * We do at least one level of search if
   *     - there is no dot and RES_DEFNAME is set, or
   *     - there is at least one dot, there is no trailing dot,
   *       and RES_DNSRCH is set.
   */
  if ((!dots && (_res.options & RES_DEFNAMES)) ||
      (dots && !trailing_dot && (_res.options & RES_DNSRCH))) {
    name[n++] = '.';
    for (domain = _res.dnsrch; *domain; domain++) {
      strncpy(name + n, *domain, maxlen - n);
      if (query_domain(nfd, name, addr, timeout) == 0)
	CLOSE_AND_RETURN(0);
      if (h_errno == NETDB_INTERNAL && errno == EINTR)
	CLOSE_AND_RETURN(-1);
      if (!(_res.options & RES_DNSRCH))
	break;
    }
  }

  /*
   * If we have not already tried the name "as is", do that now.
   * note that we do this regardless of how many dots were in the
   * name or whether it ends with a dot.
   */
  if (!tried_as_is) {
    if (query_domain(nfd, host, addr, timeout) == 0)
    {
		//LOGD("===HERE=query_domain");
		LOGD("----1----query_domain------");
     	CLOSE_AND_RETURN(0);
    }
  }
  CLOSE_AND_RETURN(-1);
//  ZBTEST:
	//  	LOGD("ZBTEST");
  //	return 0;
}

