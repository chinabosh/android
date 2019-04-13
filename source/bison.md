  0% 310/89583] //external/selinux/ch...eckpolicy yacc policy_parse.y [darwin
FAILED: out/soong/.intermediates/external/selinux/checkpolicy/checkpolicy/darwin_x86_64/gen/yacc/external/selinux/checkpolicy/policy_parse.c out/soong/.intermediates/external/selinux/checkpolicy/checkpolicy/darwin_x86_64/gen/yacc/external/selinux/checkpolicy/policy_parse.h 
BISON_PKGDATADIR=external/bison/data prebuilts/misc/darwin-x86/bison/bison -d  --defines=out/soong/.intermediates/external/selinux/checkpolicy/checkpolicy/darwin_x86_64/gen/yacc/external/selinux/checkpolicy/policy_parse.h -o out/soong/.intermediates/external/selinux/checkpolicy/checkpolicy/darwin_x86_64/gen/yacc/external/selinux/checkpolicy/policy_parse.c external/selinux/checkpolicy/policy_parse.y
[  0% 317/89583] //system/core/bootstat:bootstat clang++ bootstat.cpp
ninja: build stopped: subcommand failed.




解决方法

https://blog.csdn.net/h649305597/article/details/80322488?utm_source=blogxgwz8

--------------------- 
作者：SmartOIDHan 
来源：CSDN 
原文：https://blog.csdn.net/h649305597/article/details/80322488 
版权声明：本文为博主原创文章，转载请附上博文链接！

为防止原网站失效，复制原文到下面！！！

1、定位到源码中external/bison文件夹

cd external/bison

2、在文件夹创建文本文件patch-high-sierra.patch并把下面代码复制进去（）

With format string strictness, High Sierra also enforces that %n isn't used
in dynamic format strings, but we should just disable its use on darwin in
general.

--- lib/vasnprintf.c.orig   2017-06-22 15:19:15.000000000 -0700
+++ lib/vasnprintf.c    2017-06-22 15:20:20.000000000 -0700
@@ -4869,7 +4869,7 @@ VASNPRINTF (DCHAR_T *resultbuf, size_t *
 #endif
                   *fbp = dp->conversion;
 #if USE_SNPRINTF
-# if !(((__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 3)) && !defined __UCLIBC__) || ((defined _WIN32 || defined __WIN32__) && ! defined __CYGWIN__))
+# if !defined(__APPLE__) && !(((__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 3)) && !defined __UCLIBC__) || ((defined _WIN32 || defined __WIN32__) && ! defined __CYGWIN__))
                 fbp[1] = '%';
                 fbp[2] = 'n';
                 fbp[3] = '\0';
                 
3、在控制台（保证当前目录是external/bison）执行
patch -p0 < patch-high-sierra.patch 

4、返回根目录
cd ../.. 

5、编译bison
make bison

6、复制bison到AOSP编译时寻找bison的位置
cp ./out/host/darwin-x86/obj/EXECUTABLES/bison_intermediates/bison ./prebuilts/misc/darwin-x86/bison/bison

重新开始编译
