//
//  Action_Store.h
//  APP_Module_Test
//
//  Created by RenSihao on 16/6/23.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoreVC.h"

@interface Target_Store : NSObject

/**
 *  获取商城VC（不带广告）
 *
 *  @param params <#params description#>
 *
 *  @return <#return value description#>
 */
- (StoreVC *)Action_NativeFetchStoreVC:(NSDictionary *)params;

/**
 *  获取商城VC （带广告）
 *
 *  @param params <#params description#>
 *
 *  @return <#return value description#>
 */
- (StoreVC *)Action_NativeFetchStoreVCWithAdvertisement:(NSDictionary *)params;

#pragma mark - 本组件没有所需方法 则默认执行此方法 （所有组件一般都需要实现此方法，防止target找不到sel执行出异常）

- (id)Action_NotFound:(NSDictionary *)params;

@end
