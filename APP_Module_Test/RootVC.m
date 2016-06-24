//
//  RootVC.m
//  APP_Module_Test
//
//  Created by RenSihao on 16/6/23.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "RootVC.h"
#import "Mediator+StoreVC.h"

static NSString * const kCellIdentifier = @"kCellIdentifier";

@interface RootVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;
@end

@implementation RootVC

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    switch (indexPath.row) {
        //商城
        case 0:
        {
            //1、单纯present一个商城VC
            [self presentViewController:[[Mediator sharedInstance] Mediator_StoreVC] animated:YES completion:nil];
            
            //2、push一个有顶部广告轮播的商城VC，广告图片数据从调用者开始给
            [self.navigationController pushViewController:
             [[Mediator sharedInstance] Mediator_StoreVCWithAdvertisementWithImageNamesArray:@[@"1", @"2", @"3"]
                                                                                       frame:CGRectMake(0, 0, 300, 500)
                                                                          shouldInfiniteLoop:YES]
                               animated:YES];
        }
            break;
        //合伙人中心
        case 1:
        {
            
        }
            break;
        //我的订单
        case 2:
        {
            
        }
            break;
        //收货地址
        case 3:
        {
            
        }
            break;
        //设置
        case 4:
        {
            
        }
            break;
        default:
            break;
    }
}


#pragma mark - setter && getter

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    }
    return _tableView;
}
- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"商城", @"合伙人中心", @"我的订单", @"收货地址", @"设置"];
    }
    return _titleArray;
}

@end
