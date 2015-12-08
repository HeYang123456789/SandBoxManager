//
//  SandBoxManager.m
//  DataAccess
//
//  Created by HEYANG on 15/12/8.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import "SandBoxManager.h"

@implementation SandBoxManager
#pragma mark - 获取沙盒相关的路径

#pragma mark - get DocumentsPath and 根据文件名获取DocumentsPath完整的文件路径
+(NSString *)sandBoxDocumentsPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];//因为返回的是path是NSArray对象，而且是一个单位的数组对象
}//这个获取path方法以及参数基本是固定的。需要记下来。


//获得document文件路径
+(NSString *)sandBoxDocumentPathWithFileName:(NSString *)fileName {
    NSString *documentsPath = [self sandBoxDocumentsPath];
    // NSLog(@"documentsPath=%@",documentsPath);
    return [documentsPath stringByAppendingPathComponent:fileName];//这里就是 documentsPath + filePath
}

#pragma mark - get Library 目录
+(NSString *)sandBoxLibraryPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}
#pragma mark - get Prefenences 目录
+(NSString *)sandBoxPreferencesPath{
    NSString *paths = [[self sandBoxLibraryPath]stringByAppendingPathComponent:@"Preferences"];
    return paths;
}
+(NSString *)sandBoxPreferencesPathWithFileName:(NSString*)fileName{
    return [[self sandBoxPreferencesPath] stringByAppendingPathComponent:fileName];
}
#pragma mark - get Cache目录
+(NSString *)sandBoxCachesPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}
+(NSString*)sandBoxCachesPathWithFileName:(NSString*)fileName{
    NSString *cachesPath = [self sandBoxCachesPath];
    return [cachesPath stringByAppendingPathComponent:fileName];
}
#pragma mark - get Tmp目录
+(NSString *)sandBoxTmpPath{
    NSString *tmpDir = NSTemporaryDirectory();
    return tmpDir;
}
+(NSString*)sandBoxTmpPathWithFileName:(NSString*)fileName{
    NSString *tmpPath = [self sandBoxTmpPath];
    return [tmpPath stringByAppendingPathComponent:fileName];
}
#pragma mark - get Home目录
+(NSString *)sandBoxHomePath{
    NSString *paths = NSHomeDirectory();
    return paths;
}
+(NSString*)sandBoxHomePathWithFileName:(NSString*)fileName{
    NSString *homePath = [self sandBoxHomePath];
    return [homePath stringByAppendingPathComponent:fileName];
}
@end

#pragma mark - NSString的类别，通过文件名对象直接获取添加这个文件名的对应的沙盒目录

@implementation NSString (SandBoxPath)
-(NSString*)fileNameWithHomePath{
    return [SandBoxManager sandBoxHomePathWithFileName:self];
}

-(NSString *)fileNameWithDocoumentsPath{
    return [SandBoxManager sandBoxDocumentPathWithFileName:self];
}

-(NSString *)fileNameWithPreferencesPath{
    return [SandBoxManager sandBoxPreferencesPathWithFileName:self];
}

-(NSString *)fileNameWithCachesPath{
    return [SandBoxManager sandBoxCachesPathWithFileName:self];
}
-(NSString *)fileNameWithTmpPath{
    return [SandBoxManager sandBoxTmpPathWithFileName:self];
}


@end

@implementation NSDictionary (SandBox)
#pragma mark 读取
-(void)writeToDocumentsWithFileName:(NSString*)fileName{
    [self writeToFile:[fileName fileNameWithDocoumentsPath] atomically:YES];
}
-(void)writeToCachesWithFileName:(NSString*)fileName{
    [self writeToFile:[fileName fileNameWithCachesPath] atomically:YES];
}
-(void)writeToPreferencesWithFileName:(NSString*)fileName{
    [self writeToFile:[fileName fileNameWithPreferencesPath] atomically:YES];
}
-(void)writeToTmpWithFileName:(NSString*)fileName{
    [self writeToFile:[fileName fileNameWithTmpPath] atomically:YES];
}
#pragma mark 写入
+(NSDictionary*)readFromDocumentsWithFileName:(NSString*)fileName{
    return [self dictionaryWithContentsOfFile:[fileName fileNameWithDocoumentsPath]];
}
+(NSDictionary*)readFromCachesWithFileName:(NSString*)fileName{
    return [self dictionaryWithContentsOfFile:[fileName fileNameWithCachesPath]];
}
+(NSDictionary*)readFromPreferencesWithFileName:(NSString*)fileName{
    return [self dictionaryWithContentsOfFile:[fileName fileNameWithPreferencesPath]];
}
+(NSDictionary*)readFromTmpWithFileName:(NSString*)fileName{
    return [self dictionaryWithContentsOfFile:[fileName fileNameWithTmpPath]];
}
@end

#pragma mark - 数组对象对沙盒目录进行写入和读取

@implementation NSArray (SandBox)

#pragma mark 读取
-(void)writeToDocumentsWithFileName:(NSString*)fileName{
    [self writeToFile:[fileName fileNameWithDocoumentsPath] atomically:YES];
}
-(void)writeToCachesWithFileName:(NSString*)fileName{
    [self writeToFile:[fileName fileNameWithCachesPath] atomically:YES];
}
-(void)writeToPreferencesWithFileName:(NSString*)fileName{
    [self writeToFile:[fileName fileNameWithPreferencesPath] atomically:YES];
}
-(void)writeToTmpWithFileName:(NSString*)fileName{
    [self writeToFile:[fileName fileNameWithTmpPath] atomically:YES];
}
#pragma mark 写入
+(NSArray*)readFromDocumentsWithFileName:(NSString*)fileName{
    return [self arrayWithContentsOfFile:[fileName fileNameWithDocoumentsPath]];
}
+(NSArray*)readFromCachesWithFileName:(NSString*)fileName{
    return [self arrayWithContentsOfFile:[fileName fileNameWithCachesPath]];
}
+(NSArray*)readFromPreferencesWithFileName:(NSString*)fileName{
    return [self arrayWithContentsOfFile:[fileName fileNameWithPreferencesPath]];
}
+(NSArray*)readFromTmpWithFileName:(NSString*)fileName{
    return [self arrayWithContentsOfFile:[fileName fileNameWithTmpPath]];
}


@end

/** 问题：
 *  (1) 沙盒存储的数据类型一般有哪些？比如字典和数组，我不知道有没有别的数据类型。
 *  (2) 沙盒的四个目录各自分别一般存储哪些文件？比如我现在只知道的是Caches存储plist文件，可还能存储其他什么类型的文件不知道。
 */

//答案：
//Caches 存放大型数据，比如离线书籍，离线视频 -> 大型数据，离线书籍：sqlit  离线音频：MP3，mp4等视频
//Preferences  用户的偏好设置 -> 归档
//Documents 新旧版本更新的过程中，新版本需要记住的一些东西，
//tmp 由于随时会被删除掉，不做处理



