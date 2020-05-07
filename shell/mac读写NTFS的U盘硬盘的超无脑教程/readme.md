输入以下内容可以查看所有的磁盘设备
diskutil list
找到你插入的U盘/硬盘的名字，记住名字
输入以下命令修改系统设置
sudo vim /etc/fstab
添加以下内容
LABEL=名字 none ntfs rw,auto,nobrowse
以上的“名字”为你刚刚记下的U盘/硬盘的名字
输入以下命令来保存并退出
 :wq
按下回车。此时访达中已经无法显示你的U盘/硬盘
最后，输入下述命令来为桌面添加U盘/硬盘快捷方式
sudo ln -s /Volumes ~/Desktop/Volumes
第三步：现在回到桌面，桌面上有了一个名为Volumes的快捷方式。点击即可浏览你的U盘/硬盘。
现在你可以尝试写入文件了。
