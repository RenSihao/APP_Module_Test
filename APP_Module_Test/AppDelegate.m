//
//  AppDelegate.m
//  APP_Module_Test
//
//  Created by RenSihao on 16/6/23.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "AppDelegate.h"
#import "RootVC.h"
#import <JSPatch/JSPatch.h>

static NSString * const JSPatch_App_Key = @"ba79274069f7140d";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //以下两句代码二选一
    [self setUpJSPatch];
//    [JSPatch testScriptInBundle];
    
    [self setUpKeyWindow];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - UI
- (void)setUpKeyWindow
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[RootVC alloc] init]];
}

#pragma mark - 外界应用打开APP

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    //启用中间件调用组件
    return [[[Mediator sharedInstance] performActionWithURL:url completion:nil] boolValue];
}

#pragma mark - 初始化JSPatch

- (void)setUpJSPatch
{
#ifdef DEBUG
    [JSPatch setupLogger:^(NSString *msg) {
        NSLog(@"JSPatch_msg===>%@", msg);
    }];
    [JSPatch setupCallback:^(JPCallbackType type, NSDictionary *data, NSError *error) {
        
    }];
    [JSPatch setupDevelopment];
    [JSPatch startWithAppKey:JSPatch_App_Key];
    [JSPatch sync];
#else
    [JSPatch startWithAppKey:JSPatch_App_Key];
    [JSPatch sync];
    
#endif
}


@end


