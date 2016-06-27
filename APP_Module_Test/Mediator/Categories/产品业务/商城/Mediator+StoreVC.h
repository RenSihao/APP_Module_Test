//
//  Mediator+StoreVC.h
//  APP_Module_Test
//
//  Created by RenSihao on 16/6/23.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "Mediator.h"
#import "StoreVC.h"

@interface Mediator (MediatorStoreActions)

/**
 *  展示一个普通商城VC（空的）
 *
 *  @return <#return value description#>
 */
- (StoreVC *)Mediator_StoreVCWithBlock:(void(^)(NSString *title))block;


/**
 *  展示一个商城VC（带广告轮播的）
 *
 *  @param imageNamesArray <#imageNamesArray description#>
 *  @param frame           <#frame description#>
 *  @param infiniteLoop    <#infiniteLoop description#>
 *
 *  @return <#return value description#>
 */
- (StoreVC *)Mediator_StoreVCWithAdvertisementWithImageNamesArray:(NSArray *)imageNamesArray
                                                            frame:(CGRect)frame
                                               shouldInfiniteLoop:(BOOL)infiniteLoop;

@end
