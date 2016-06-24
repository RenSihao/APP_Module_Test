//
//  StoreVC.m
//  APP_Module_Test
//
//  Created by RenSihao on 16/6/23.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "StoreVC.h"
#import "Mediator+SDCycleScrollView.h"
#import "SDCycleScrollView.h"

@interface StoreVC ()  <SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *advertisementScrollView;
@end

@implementation StoreVC

#pragma mark - public method
- (instancetype)initWithFrame:(CGRect)frame shouldInfiniteLoop:(BOOL)infiniteLoop imageNamesArray:(NSArray *)imageNamesArray
{
    if (self = [super init]) {
        
        self.advertisementScrollView =
        [[Mediator sharedInstance] Mediator_LocalAdvertisementScrollViewWithFrame:frame
                                                               shouldInfiniteLoop:infiniteLoop
                                                                  imageNamesArray:imageNamesArray];
    }
    return self;
}

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"商城";
    self.view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.advertisementScrollView];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark - event response
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - setter && getter

@end
