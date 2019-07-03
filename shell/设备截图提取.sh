time=`date +%Y%m%d%H%M`
adb shell screencap -p /sdcard/${time}.jpg
#/Users/bosh/Downloads/screenshot 这一串可修改为电脑实际保存截图地址
adb pull /sdcard/${time}.jpg /Users/bosh/Downloads/screenshot
#若手机内不保存截图，可把下面这句打开
#adb shell rm /sdcard/${time}.jpg
