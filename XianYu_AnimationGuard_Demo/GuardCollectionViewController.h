//
//  GuardCollectionViewController.h
//  XianYu_AnimationGuard_Demo
//
//  Created by admin on 16/7/13.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MS_Width [UIScreen mainScreen].bounds.size.width
#define MS_Height [UIScreen mainScreen].bounds.size.height
#define Key_Window [UIApplication sharedApplication].keyWindow


@interface GuardCollectionViewController : UICollectionViewController


/** 封面图片 */
@property (nonatomic, strong) NSArray *guideImagesArr;
/** 视频地址 */
@property (nonatomic, strong) NSArray *guideMoviePathArr;
/** 最后一个视频播放完毕 */
@property (nonatomic, copy) void (^lastOnePlayFinished)();



@end
