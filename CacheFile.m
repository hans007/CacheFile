//
//  CacheFile.m
//  injoy
//
//  Created by tao hans on 13-3-22.
//  Copyright (c) 2013年 injoy365.net. All rights reserved.
//

#import "CacheFile.h"

@implementation CacheFile




// 缓存文件 设置
+(BOOL)cache_file_set:(NSString*)fileName contents:(NSString*)contents
{
    NSError *err;
    NSString *path = [self cache_file_path:fileName];
    NSFileManager *fm=[NSFileManager defaultManager];
    if ([fm fileExistsAtPath:path]) {
        [fm removeItemAtPath:path error:&err];
    }
    return [fm createFileAtPath:path contents:[contents dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
}

// 缓存文件 设置 NSData
+(BOOL)cache_file_set_nsdata:(NSString*)fileName contents:(NSData*)contents
{
    NSError *err;
    NSString *path = [self cache_file_path:fileName];
    NSFileManager *fm=[NSFileManager defaultManager];
    if ([fm fileExistsAtPath:path]) {
        [fm removeItemAtPath:path error:&err];
    }
    return [fm createFileAtPath:path contents:contents attributes:nil];
}

// 缓存文件 读取
+(NSString*)cache_file_get:(NSString*)fileName
{
    NSString *path = [self cache_file_path:fileName];
    NSFileManager *fm=[NSFileManager defaultManager];
    if ([fm fileExistsAtPath:path]) {
        return [[NSString alloc] initWithData:[fm contentsAtPath:path] encoding:NSUTF8StringEncoding];
    }
    return @"";
}

// 缓存文件 读取 NSData
+(NSData*)cache_file_get_nsdata:(NSString*)fileName
{
    NSString *path = [self cache_file_path:fileName];
    NSFileManager *fm=[NSFileManager defaultManager];
    if ([fm fileExistsAtPath:path]) {
        return [fm contentsAtPath:path];
    }
    return nil;
}

// 缓存文件 是否过期
// expiredSecond 过期多少秒
+(BOOL)cache_file_expired:(NSString*)fileName expiredSecond:(NSInteger)expiredSecond
{
    NSString *path = [self cache_file_path:fileName];
    NSFileManager *fm=[NSFileManager defaultManager];
    if (![fm fileExistsAtPath:path]) {
        return YES;
    }
    
    NSError *err;
    NSDictionary *fileAttributes = [fm attributesOfFileSystemForPath:path error:&err];
    NSDate *fileModDate = [fileAttributes objectForKey:NSFileModificationDate];
    if ([[NSDate date] timeIntervalSinceDate:fileModDate] > expiredSecond) {
        return  YES;
    }
    else{
        return NO;
    }
    
    return  YES;
}

// 缓存文件 是否存在
+(BOOL)cache_file_exists:(NSString*)fileName
{
    NSString *path = [self cache_file_path:fileName];
    NSFileManager *fm=[NSFileManager defaultManager];
    return [fm fileExistsAtPath:path];
}

// 缓存文件 删除
+(BOOL)cache_file_delete:(NSString*)fileName
{
    NSString *path = [self cache_file_path:fileName];
    NSFileManager *fm=[NSFileManager defaultManager];
    if ([fm fileExistsAtPath:path]) {
        NSError *err;
        return [fm removeItemAtPath:path error:&err];
    }
    return YES;
}

// 缓存文件 路径
+(NSString*)cache_file_path:(NSString*) fileName
{
    NSString* path=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    path=[path stringByAppendingString:@"/"];
    path=[path stringByAppendingString:fileName];
    
    return path;
}






@end
