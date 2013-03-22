CacheFile
by hans
email tao.hans@gmail.com
=========


这是一个用在  ios 开发上的 本地缓存类～



==================================================================================
用法例子如下:
==================================================================================

设置字符串缓存
[CacheFile cache_file_set:"缓存文件名" contents:@"缓存字符串内容"];

读取字符串缓存
[CacheFile cache_file_get:"缓存文件名"];




==================================================================================
头文件定义如下:
==================================================================================

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








