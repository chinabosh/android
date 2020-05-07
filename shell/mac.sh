#关闭spotlight
sudo mdutil -a -i off
#开启spotlight
sudo mdutil -a -i on
#重命名
mv [old] [new]
#获取本机局域网ip
ifconfig | grep 192.168
#在finder中打开目录
open .
open ..
#echo -n 加-n让后面的字符串不带换行符，不然会自动带上换行符导致结果不准
#base64编码
echo -n "a"|base64
#base64解码
echo -n "a"|base64 -d
#md5
echo -n "a"|md5
#sha
shasum -a 256 a.txt
