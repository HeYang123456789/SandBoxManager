SandBoxManager的Data Access类拓展的封装 

已经完成的部分：

```
	1：沙盒的五个目录Documents,Caches,Library,Preferences,tmp的目录获取
	2：根据指定文件对沙盒的五个目录Documents,Caches,Library,Preferences,tmp的文件目录获取
	3：写出(NSString*)fileName的类别
	4：实现了对字典和数组对象的直接存取
	5：实现了偏好设置的类别拓展，直接通过NSUserDefaults类方法就能实现存取用户偏好设置
```
	
完成的部分代码使用展示：

首先需要拷贝项目中的文件到你需要使用的项目中去：

![MacDown logo](https://github.com/HeYang123456789/SandBoxManager/blob/master/导入的代码文件.png?raw=true)

然后在你的需要对沙盒进行操作的文件中加上即可：

```
#import "SandBoxManager.h"
```

然后字典和数组存取使用示例：

1、存取一个字典

```
    NSDictionary* dic = @{@"Hello":@"non",@"World":@"mao"};
    //字典存储的plist文件名是Hello.plist
    NSString* fileName = @"Hello.plist";
    
    //这里就是直接使用SandBoxManager的封装好的方法，将字典写入Caches目录下并自动创建的Hello.plist文件
    [dic writeToCachesWithFileName:fileName];
    
    //读取Caches目录下fileName的数据
    NSDictionary* dict = [NSDictionary readFromCachesWithFileName:fileName];

    NSLog(@"%@",dict);
```

2、存取一个数组

```
    NSArray* arr = @[@12,@24,@45,@"shel"];
    //字典存储的txt文件名是Hello.txt
    NSString* fileName2 = @"Hello.txt";
    
    //将数组写入，然后读取
    [arr writeToCachesWithFileName:fileName2];
    NSArray* array = [NSArray readFromCachesWithFileName:fileName2];
    
    NSLog(@"%@",array);
```

沙盒目录下截图展示效果展示：

![MacDown logo](https://github.com/HeYang123456789/SandBoxManager/blob/master/sandBoxPicture.png?raw=true)

3、存取偏好设置 (默认存储在沙盒的Preferences目录下)

```
//直接使用NSUserDefaults的类方法
//不需要自己创建这个单例对象，因为通过类别封装起来了
[NSUserDefaults setObject:@"heyang" forKey:@"name"];
[NSUserDefaults setObject:@"donghualigongdaxue" forKey:@"xuexiao"];

NSLog(@"%@",[NSUserDefaults objectForKey:@"name"]);
NSLog(@"%@",[NSUserDefaults objectForKey:@"xuexiao"]);
```

还需要考虑的问题：

```
Caches 存放大型数据，比如离线书籍，离线视频 -> 大型数据，离线书籍：sqlit  离线音频：MP3，mp4等视频
Preferences  用户的偏好设置 -> 归档
Documents 新旧版本更新的过程中，新版本需要记住的一些东西，
tmp 由于随时会被删除掉，不做处理
```

需要考虑添加的业务逻辑：

```
	1、在沙盒目录下创建文目录。
	2、获取沙盒目录下指定目录下的文件名。
	3、更改目录
	4、删除文件和目录
	5、混合数据的读写(看样子需要NSFileManager)
	6、检测文件/文件夹是否存在
	7、拷贝文件http://www.cnblogs.com/YouXianMing/p/4129168.html
	8、搜索文件
```

还需要参考的学习连接：

```
1、参考链接：http://www.uml.org.cn/mobiledev/201209211.asp
2、FZEasyFile的使用：http://www.cnblogs.com/YouXianMing/p/3710809.html
3、数据持久化：http://www.cnblogs.com/YouXianMing/p/3642282.html加密存储，让别人看不了存储的数据。

```	
	
需要涉及用到的知识：

```
设计模式的使用，数据库的使用，core data的使用，音频API的使用。
```
		

