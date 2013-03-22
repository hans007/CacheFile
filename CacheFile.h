//
//  CacheFile.h
//  injoy
//
//  Created by tao hans on 13-3-22.
//  Copyright (c) 2013年 injoy365.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheFile : NSObject




// 缓存文件 设置
+(BOOL)cache_file_set:(NSString*)fileName contents:(NSString*)contents;

// 缓存文件 设置 NSData
+(BOOL)cache_file_set_nsdata:(NSString*)fileName contents:(NSData*)contents;

// 缓存文件 读取
+(NSString*)cache_file_get:(NSString*)fileName;

// 缓存文件 读取 NSData
+(NSData*)cache_file_get_nsdata:(NSString*)fileName;

// 缓存文件 是否过期
// expiredSecond 过期多少秒
+(BOOL)cache_file_expired:(NSString*)fileName expiredSecond:(NSInteger)expiredSecond;

// 缓存文件 是否存在
+(BOOL)cache_file_exists:(NSString*)fileName;

// 缓存文件 删除
+(BOOL)cache_file_delete:(NSString*)fileName;

// 缓存文件 路径
+(NSString*)cache_file_path:(NSString*) fileName;




@end
