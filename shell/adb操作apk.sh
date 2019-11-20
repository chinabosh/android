#安装apk
adb install ./app-debug.apk
#通过包名卸载apk
adb uninstall com.test.example
#查看安装的包 
adb shell pm list packages
