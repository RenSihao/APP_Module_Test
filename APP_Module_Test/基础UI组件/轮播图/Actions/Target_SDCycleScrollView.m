//
//  Target_SDCycleScrollView.m
//  APP_Module_Test
//
//  Created by RenSihao on 16/6/24.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "Target_SDCycleScrollView.h"
#import "SDCycleScrollView.h"

@implementation Target_SDCycleScrollView

- (SDCycleScrollView *)Action_NativeShowLocalAdvertisement:(NSDictionary *)params
{
    //1、拆解params
    NSValue *frameValue = [params valueForKey:@"frame"];
    CGRect frameRect = [frameValue CGRectValue];
    
    NSNumber *infiniteLoopNumber = [params valueForKey:@"infiniteLoop"];
    BOOL infiniteLoopBool = [infiniteLoopNumber boolValue];
    
    NSArray *imageNamesArray = [params valueForKey:@"imageNamesArray"];
    
    
    //2、实例化
    SDCycleScrollView *advertisementView = [SDCycleScrollView cycleScrollViewWithFrame:frameRect
                                                                    shouldInfiniteLoop:infiniteLoopBool
                                                                       imageNamesGroup:imageNamesArray];
    return advertisementView;
}
@end
