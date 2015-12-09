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

    
    
//    [userDefaults setObject:@"heyang" forKey:@"name"];
    
    [NSUserDefaults setObject:@"heyang" forKey:@"name" isSynchronize:YES];
    
    
}




@end
