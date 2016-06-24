//
//  Mediator+StoreVC.m
//  APP_Module_Test
//
//  Created by RenSihao on 16/6/23.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "Mediator+StoreVC.h"

#pragma mark - 商城组件 唯一Target
NSString * const kMediatorTargetStore = @"Store";

#pragma mark - 商城组件 众多Actions
NSString * const kMediatorActionNativeFetchStoreVC = @"NativeFetchStoreVC";
NSString * const kMediatorActionNativeFetchStoreVCWithAdvertisement = @"NativeFetchStoreVCWithAdvertisement";
//...


@implementation Mediator (MediatorStoreActions)

- (StoreVC *)Mediator_StoreVC
{
    //利用 Target - Action 模式 迅速前往对应本地组件 调用相应方法
    StoreVC *storeVC = [self performTarget:kMediatorTargetStore
                                    action:kMediatorActionNativeFetchStoreVC
                                    params:nil];
    
    if ([storeVC isKindOfClass:[StoreVC class]]) {
        
        //正常情况下 将该组件实例化好的对象返回给调用者
        return storeVC;
    
    } else {
        //异常情况
        return [[StoreVC alloc] init];
    }
}

- (StoreVC *)Mediator_StoreVCWithAdvertisementWithImageNamesArray:(NSArray *)imageNamesArray frame:(CGRect)frame shouldInfiniteLoop:(BOOL)infiniteLoop
{
    //装配params
    StoreVC *storeVC = [self performTarget:kMediatorTargetStore
                                    action:kMediatorActionNativeFetchStoreVCWithAdvertisement
                                    params:@{@"imageNamesArray":imageNamesArray,
                                             @"frame"          :[NSValue valueWithCGRect:frame],
                                             @"infiniteLoop"   :[NSNumber numberWithBool:infiniteLoop]}];
    
    if ([storeVC isKindOfClass:[StoreVC class]]) {
    
        return storeVC;
    } else {
        
        return [[StoreVC alloc] init];
    }
}


@end
