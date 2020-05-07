Android系统对dalvik的vmheapsize作了硬性限制，当java进程申请的java空间超过阈值时，  
就会抛出OOM异常（这个阈值可以是48M、24M、16M等，视机型而定），可以通过 

``` commandline
    adb shell getprop | grep dalvik.vm.heapgrowthlimit
``` 

查看此值