//
//  Mediator+SDCycleScrollView.h
//  APP_Module_Test
//
//  Created by RenSihao on 16/6/24.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "Mediator.h"
#import "SDCycleScrollView.h"

@interface Mediator (SDCycleScrollView)

/**
 *  广告轮播图 - 本地图片
 *
 *  @param frame           <#frame description#>
 *  @param infiniteLoop    <#infiniteLoop description#>
 *  @param imageNamesArray <#imageNamesArray description#>
 *  @param delegate        <#delegate description#>
 *
 *  @return <#return value description#>
 */
- (SDCycleScrollView *)Mediator_LocalAdvertisementScrollViewWithFrame:(CGRect)frame
                                                   shouldInfiniteLoop:(BOOL)infiniteLoop
                                                      imageNamesArray:(NSArray *)imageNamesArray;

/**
 *  广告轮播图 - 网络图片
 *
 *  @param params <#params description#>
 *
 *  @return <#return value description#>
 */
- (void)Mediator_ShowNetAdvertisementScrollView:(NSDictionary *)params;

@end
