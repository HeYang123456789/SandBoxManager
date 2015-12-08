SandBoxDataAccess类拓展的封装  步骤跟踪


已经完成的部分：
	1：沙盒的五个目录Documents,Caches,Library,Preferences,tmp的目录获取
	2：根据指定文件对沙盒的五个目录Documents,Caches,Library,Preferences,tmp的文件目录获取
	3：写出(NSString*)fileName的类别
	
未完成的目标：

数据 writeToSandBox文件夹WithFileName:(NSString*)fileName;

数据 readToSandBox文件夹WithFileName:(NSString*)fileName;

优化的可能性：

```


1、不一定要用类别拓展，可以自定义类，因为类别不能继续在拓展，所以使用自定义类(已经优化)
2、


```

[字典对象 readToSandBox文件夹WithFileName:fileName];

		
		
		

