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
    
    NSString* fileName = @"Hello.plist";
    
    [dic writeToCachesWithFileName:fileName];
    
    NSDictionary* dict = [NSDictionary readFromCachesWithFileName:fileName];
    
    NSLog(@"%@",dict);
    
    //存储一个数组
    NSArray* arr = @[@12,@24,@45,@"shel"];
    
    [arr writeToCachesWithFileName:fileName];
    
    
    NSArray* array = [NSArray readFromCachesWithFileName:fileName];
    
    NSLog(@"%@",array);
    
    
}




@end
