//
//  ViewController.m
//  SandBoxManager 数据存储
//
//  Created by HEYANG on 15/12/8.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import "ViewController.h"
#import "SandBoxManager.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //存储一个字典
    NSDictionary* dic = @{@"Hello":@"non",@"World":@"mao"};
    //字典存储的plist文件名是Hello.plist
    NSString* fileName = @"Hello.plist";
    
    //这里就是直接使用SandBoxManager的封装好的方法，将字典写入Caches目录下并自动创建的Hello.plist文件
    [dic writeToCachesWithFileName:fileName];
    
    //读取Caches目录下fileName的数据
    NSDictionary* dict = [NSDictionary readFromCachesWithFileName:fileName];

    NSLog(@"%@",dict);
    /*============================================================================*/
    //存储一个数组
    NSArray* arr = @[@12,@24,@45,@"shel"];
    //字典存储的txt文件名是Hello.txt
    NSString* fileName2 = @"Hello.txt";
    //将数组写入，然后读取
    [arr writeToCachesWithFileName:fileName2];
    NSArray* array = [NSArray readFromCachesWithFileName:fileName2];
    
    NSLog(@"%@",array);
    
    
}




@end
