#ifndef MK1MF_BUILD
    /* auto-generated by util/mkbuildinf.pl for crypto/cversion.c */
    #define CFLAGS cflags
    /*
     * Generate CFLAGS as an array of individual characters. This is a
     * workaround for the situation where CFLAGS gets too long for a C90 string
     * literal
     */
    static const char cflags[] = {
        'c','o','m','p','i','l','e','r',':',' ','a','r','m','-','l','i','n','u',
        'x','-','g','n','u','e','a','b','i','h','f','-','g','c','c',' ','-','I',
        '.',' ','-','I','.','.',' ','-','I','.','.','/','i','n','c','l','u','d',
        'e',' ',' ','-','D','O','P','E','N','S','S','L','_','T','H','R','E','A',
        'D','S',' ',' ','\0'
    };
    #define PLATFORM "platform: os/compiler"
    #define DATE "built on: Thu Sep 24 11:11:50 2015"
#endif