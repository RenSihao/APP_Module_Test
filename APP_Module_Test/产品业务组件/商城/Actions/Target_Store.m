//
//  Action_Store.m
//  APP_Module_Test
//
//  Created by RenSihao on 16/6/23.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "Target_Store.h"

@implementation Target_Store

//获取商城VC (不带广告轮播图)
- (StoreVC *)Action_NativeFetchStoreVC:(NSDictionary *)params
{
    //因为action是隶属于module的 所以action可以直接使用module里的所有声明
    //对于此处 即获取商城这个动作 实例化该VC的方法 是完全属于商城组件的
    StoreVC *storeVC = [[StoreVC alloc] init];
    //也可以在此处对params进行拆分 然后赋值VC属性 等等
    //...
    
    return storeVC;
}

//获取商城VC （带广告轮播图）
- (StoreVC *)Action_NativeFetchStoreVCWithAdvertisement:(NSDictionary *)params
{
    //解析params
    NSArray *imageNamesArray = [params objectForKey:@"imageNamesArray"];
    
    NSValue *frameValue = [params objectForKey:@"frame"];
    CGRect frame = [frameValue CGRectValue];
    
    NSNumber *infiniteLoopNumber = [params objectForKey:@"infiniteLoop"];
    BOOL infiniteLoopBool = [infiniteLoopNumber boolValue];
    
    //调用此初始化方法，至于再次启用中间件，调用轮播组件，则是它自己内部需要实现，这里并不关心，只需要把数据传递过去即可
    StoreVC *storeVC = [[StoreVC alloc] initWithFrame:frame
                                   shouldInfiniteLoop:infiniteLoopBool
                                      imageNamesArray:imageNamesArray];
    
    //这里希望在StoreVC的view上add一个广告轮播图控件，但是这个轮播图控件我已经将其改造成 基础UI组件 里的轮播组件了
    
    
    //方案一 拆包params 赋值给广告轮播图 前提是StoreVC里已经add过这个控件 此处只需要赋值
    //但是有个疑惑，在StoreVC里view直接add此控件，是不是污染了？讲道理组件之间的互相调用，不应该也启用中间件吗？比如方案二
    
//    storeVC.advertisementScrollView.localizationImageNamesGroup = imageNamesArray;
    
    //方案二 直接在这里启用中间件，利用target-action机制，调用轮播图组件（该组件跟商城组件属同一级别）
    
    
    
    return storeVC;
}

#pragma mark - 异常处理

- (id)Action_NotFound:(NSDictionary *)params
{
    return @(NO);
}

@end
