//
//  Mediator+SDCycleScrollView.m
//  APP_Module_Test
//
//  Created by RenSihao on 16/6/24.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "Mediator+SDCycleScrollView.h"

#pragma mark - Target
NSString * const kMediatorTargetSDCycleScrollView = @"SDCycleScrollView";

#pragma mark - Actions
NSString * const kMediatorActionNativeShowLocalAdvertisement = @"NativeShowLocalAdvertisement";
NSString * const kMediatorActionNativeShowNetAdvertisement = @"NativeShowNetAdvertisement";

@implementation Mediator (SDCycleScrollView)

- (SDCycleScrollView *)Mediator_LocalAdvertisementScrollViewWithFrame:(CGRect)frame
                                                   shouldInfiniteLoop:(BOOL)infiniteLoop
                                                      imageNamesArray:(NSArray *)imageNamesArray
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:[NSValue valueWithCGRect:frame] forKey:@"frame"];
    [params setObject:[NSNumber numberWithBool:infiniteLoop] forKey:@"infiniteLoop"];
    [params setObject:imageNamesArray forKey:@"imageNamesArray"];
    
    return [self performTarget:kMediatorTargetSDCycleScrollView
                 action:kMediatorActionNativeShowLocalAdvertisement
                 params:params];
}

- (void)Mediator_ShowNetAdvertisementScrollView:(NSDictionary *)params
{
    
}
@end
