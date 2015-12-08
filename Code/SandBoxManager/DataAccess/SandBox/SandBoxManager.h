//
//  SandBoxManager.h
//  DataAccess
//
//  Created by HEYANG on 15/12/8.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - SandBoxManager类

@interface SandBoxManager : NSObject

#pragma mark  1 - 关于DocumentsPath
/**
 *  get DocumentsPath
 *
 */
+(NSString *)sandBoxDocumentsPath;

/**
 *  get 文件名获取DocumentsPath完整的文件路径
 *
 */
+(NSString *)sandBoxDocumentPathWithFileName:(NSString *)fileName;

#pragma mark  2 - 关于LibraryPath
/**
 *  get Library目录
 *  Library目录下又两个目录：Caches和Preferences，
 *  所以一般不会把文件数据直接存储在Library目录下面的
 */
+(NSString *)sandBoxLibraryPath;
#pragma mark  3 - get Prefenences 目录
/**
 *  get Preferences目录
 *
 */
+(NSString *)sandBoxPreferencesPath;
/**
 *  get Preferencesd的filePath
 *
 */
+(NSString *)sandBoxPreferencesPathWithFileName:(NSString*)fileName;

#pragma mark  4 - 关于CachePath
/**
 *  get Caches目录
 *
 */
+(NSString *)sandBoxCachesPath;

/**
 *  get Caches的filePath
 *
 */

+(NSString*)sandBoxCachesPathWithFileName:(NSString*)fileName;

#pragma mark  5 - 关于TmpPath
/**
 *  get Tmp目录
 *
 */
+(NSString *)sandBoxTmpPath;
/**
 *  get Tmp的filePath
 *
 */
+(NSString*)sandBoxTmpPathWithFileName:(NSString*)fileName;

#pragma mark  6 - 关于HomePath
/**
 *  get Home目录
 *
 */
+(NSString *)sandBoxHomePath;
/**
 *  get Home的filePath
 *
 */
+(NSString*)sandBoxHomePathWithFileName:(NSString*)fileName;

@end

#pragma mark - NSString的类别，通过文件名对象直接获取添加这个文件名的对应的沙盒目录

@interface NSString (SandBoxPath)
/**
 *  get 文件名获取DocumentsPath完整的文件路径
 *
 */
-(NSString *)fileNameWithDocoumentsPath;
/**
 *  get Preferences的filePath
 *
 */
-(NSString *)fileNameWithPreferencesPath;
/**
 *  get Caches的filePath
 *
 */
-(NSString *)fileNameWithCachesPath;
/**
 *  get Tmp的filePath
 *
 */
-(NSString *)fileNameWithTmpPath;

@end
#pragma mark - 字典对象对沙盒目录进行写入和读取
@interface NSDictionary (SandBox)
#pragma mark 读取
-(void)writeToDocumentsWithFileName:(NSString*)fileName;
-(void)writeToCachesWithFileName:(NSString*)fileName;
-(void)writeToPreferencesWithFileName:(NSString*)fileName;
-(void)writeToTmpWithFileName:(NSString*)fileName;
#pragma mark 写入
+(NSDictionary*)readFromDocumentsWithFileName:(NSString*)fileName;
+(NSDictionary*)readFromCachesWithFileName:(NSString*)fileName;
+(NSDictionary*)readFromPreferencesWithFileName:(NSString*)fileName;
+(NSDictionary*)readFromTmpWithFileName:(NSString*)fileName;
@end


#pragma mark - 数组对象对沙盒目录进行写入和读取

@interface NSArray (SandBox)

#pragma mark 读取
-(void)writeToDocumentsWithFileName:(NSString*)fileName;
-(void)writeToCachesWithFileName:(NSString*)fileName;
-(void)writeToPreferencesWithFileName:(NSString*)fileName;
-(void)writeToTmpWithFileName:(NSString*)fileName;
#pragma mark 写入
+(NSArray*)readFromDocumentsWithFileName:(NSString*)fileName;
+(NSArray*)readFromCachesWithFileName:(NSString*)fileName;
+(NSArray*)readFromPreferencesWithFileName:(NSString*)fileName;
+(NSArray*)readFromTmpWithFileName:(NSString*)fileName;


@end
















