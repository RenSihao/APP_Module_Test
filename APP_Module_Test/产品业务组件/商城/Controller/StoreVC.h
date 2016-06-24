//
//  StoreVC.h
//  APP_Module_Test
//
//  Created by RenSihao on 16/6/23.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreVC : UIViewController


/**
 *  带广告轮播图的商城VC
 *
 *  @param frame           <#frame description#>
 *  @param infiniteLoop    <#infiniteLoop description#>
 *  @param imageNamesArray <#imageNamesArray description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame
           shouldInfiniteLoop:(BOOL)infiniteLoop
              imageNamesArray:(NSArray *)imageNamesArray;
@end
