//
//  AppDelegate.m
//  XianYu_AnimationGuard_Demo
//
//  Created by admin on 16/7/13.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "GuardCollectionViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [self setGuardVC];
    
    [self.window makeKeyAndVisible];

    
    
    return YES;
}
- (GuardCollectionViewController *)setGuardVC
{
    GuardCollectionViewController *guardVC = [[GuardCollectionViewController alloc] init];
    // 设置本地视频路径数组
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<4; i++) {
        [array addObject:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"guide%d",i] ofType:@"mp4"]];
    }
    guardVC.guideMoviePathArr = array;
    // 设置封面图片数组
    guardVC.guideImagesArr = @[@"guide0", @"guide1", @"guide2", @"guide3"];
    // 设置最后一个视频播放完成之后的block
    [guardVC setLastOnePlayFinished:^{
        UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
        [UIApplication sharedApplication].keyWindow.rootViewController = rootNav;
    }];
    return guardVC;
}

@end
