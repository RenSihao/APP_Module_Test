//
//  Mediator.m
//  APP_Module_Test
//
//  Created by RenSihao on 16/6/23.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "Mediator.h"

NSString * const MyAppScheme = @"xxx";

@implementation Mediator


+ (instancetype)sharedInstance
{
    static Mediator *mediatro;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediatro = [[Mediator alloc] init];
    });
    return mediatro;
}

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params
{
    NSString *targetClassString = [NSString stringWithFormat:@"Target_%@", targetName];
    NSString *actionString      = [NSString stringWithFormat:@"Action_%@:", actionName];
    
    Class targetClass = NSClassFromString(targetClassString);
    id target = [[targetClass alloc] init];
    SEL action = NSSelectorFromString(actionString);
    
    //这里是处理无响应请求的地方之一，这个demo做得比较简单，如果没有可以响应的target，就直接return了。实际开发过程中是可以事先给一个固定的target专门用于在这个时候顶上，然后处理这种请求的
    if (target == nil) {
        return nil;
    }
    
    //正常情况下
    if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
    } else {
        
        //这里是处理无响应请求的地方，如果无响应，则尝试调用对应target的notFound方法统一处理
        SEL action = NSSelectorFromString(@"NotFound:");
        if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
        } else {
            
            // 这里也是处理无响应请求的地方，在notFound都没有的时候，这个demo是直接return了。实际开发过程中，可以用前面提到的固定的target顶上的
            return nil;
        }
    }
}

/*
 scheme://[target]/[action]?[params]
 
 url example:
 xxx://targetA/actionB?id=001&username=rsh&password=123456
 
 url.scheme  xxx://targetA/actionB?id=001&username=rsh&password=123456
 url.query   id=001&username=rsh&password=123456
 url.host    targetA
 url.path    /actionB
 */

- (id)performActionWithURL:(NSURL *)url completion:(void (^)(NSDictionary *))completion
{
    if (![url.scheme isEqualToString:MyAppScheme]) {
        NSLog(@"");
        return @(NO);
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSString *urlString = [url query];
    //分割 & 的字符串，搞成数组
    for (NSString *param in [urlString componentsSeparatedByString:@"&"]) {
        
        //拿出 = 前后的键值对，搞成数组
        NSArray *elements = [param componentsSeparatedByString:@"="];
        
        //不足一对key-value，不要
        if (elements.count < 2) continue;
        
        [params setObject:[elements lastObject] forKey:[elements firstObject]];
    }
    
    //处于安全考虑
    NSString *actionName = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    if ([actionName hasPrefix:@"Native"]) {
        return @(NO);
    }
    
    //一般场景，只需要取对应target和action名字，调用本地组件
    id result = [self performTarget:url.host action:actionName params:params];
    
    if (completion) {
        if (result) {
            completion(@{@"result":result});
        } else {
            completion(nil);
        }
    }
    
    return result;
}

@end


