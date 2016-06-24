//
//  Mediator.h
//  APP_Module_Test
//
//  Created by RenSihao on 16/6/23.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mediator : NSObject

+ (instancetype)sharedInstance;

/**
 *  本地组件调用入口
 *
 *  @param targetName <#targetName description#>
 *  @param actionName <#actionName description#>
 *  @param params     <#params description#>
 *
 *  @return <#return value description#>
 */
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params;

/**
 *  远程APP调用入口
 *
 *  @param url        <#url description#>
 *  @param completion <#completion description#>
 *
 *  @return <#return value description#>
 */
- (id)performActionWithURL:(NSURL *)url completion:(void(^)(NSDictionary *info))completion;


@end
