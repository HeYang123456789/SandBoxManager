ScandBoxManager

沙盒机制管理员

还需要考虑的问题：

```
Caches 存放大型数据，比如离线书籍，离线视频 -> 大型数据，离线书籍：sqlit  离线音频：MP3，mp4等视频
Preferences  用户的偏好设置 -> 归档
Documents 新旧版本更新的过程中，新版本需要记住的一些东西，
tmp 由于随时会被删除掉，不做处理
```

需要考虑的业务逻辑：
	1、在沙盒目录下创建文目录。
	2、获取沙盒目录下指定目录下的文件名。
	3、更改目录
	4、删除文件和目录
	5、混合数据的读写(看样子需要NSFileManager)
	6、检测文件/文件夹是否存在
	7、拷贝文件http://www.cnblogs.com/YouXianMing/p/4129168.html
	8、搜索文件

参考链接：http://www.uml.org.cn/mobiledev/201209211.asp


FZEasyFile的使用：http://www.cnblogs.com/YouXianMing/p/3710809.html


数据持久化：http://www.cnblogs.com/YouXianMing/p/3642282.html加密存储，让别人看不了存储的数据。





