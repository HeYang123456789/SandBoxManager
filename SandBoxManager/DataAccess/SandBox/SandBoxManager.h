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

#pragma mark  1-1 - 关于DocumentsPath
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

#pragma mark  1-2 - 关于LibraryPath
/**
 *  get Library目录
 *  Library目录下又两个目录：Caches和Preferences，
 *  所以一般不会把文件数据直接存储在Library目录下面的
 */
+(NSString *)sandBoxLibraryPath;
#pragma mark  1-3 - get Prefenences 目录
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

#pragma mark  1-4 - 关于CachePath
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

#pragma mark  1-5 - 关于TmpPath
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

#pragma mark  1-6 - 关于HomePath
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
#pragma mark - 2-1 关于偏好设置的存储
@interface NSUserDefaults (SandBoxManager)
//使用了单例类NSUserDefaults
/*
 - (nullable id)objectForKey:(NSString *)defaultName;
 - (void)setObject:(nullable id)value forKey:(NSString *)defaultName;
 - (void)removeObjectForKey:(NSString *)defaultName;
 
 - (nullable NSString *)stringForKey:(NSString *)defaultName;
 - (nullable NSArray *)arrayForKey:(NSString *)defaultName;
 - (nullable NSDictionary<NSString *, id> *)dictionaryForKey:(NSString *)defaultName;
 - (nullable NSData *)dataForKey:(NSString *)defaultName;
 - (nullable NSArray<NSString *> *)stringArrayForKey:(NSString *)defaultName;
 - (NSInteger)integerForKey:(NSString *)defaultName;
 - (float)floatForKey:(NSString *)defaultName;
 - (double)doubleForKey:(NSString *)defaultName;
 - (BOOL)boolForKey:(NSString *)defaultName;
 - (nullable NSURL *)URLForKey:(NSString *)defaultName NS_AVAILABLE(10_6, 4_0);
 
 - (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName;
 - (void)setFloat:(float)value forKey:(NSString *)defaultName;
 - (void)setDouble:(double)value forKey:(NSString *)defaultName;
 - (void)setBool:(BOOL)value forKey:(NSString *)defaultName;
 - (void)setURL:(nullable NSURL *)url forKey:(NSString *)defaultName NS_AVAILABLE(10_6, 4_0);
 */
/*使用案例
 
 */
//+(void)setObject

+(void)setObject:(id)value forKey:(NSString *)defaultName;
+(void)setObject:(id)value forKey:(NSString *)defaultName isSynchronize:(BOOL)isSynchronize;

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
/*=============================================*/

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
















