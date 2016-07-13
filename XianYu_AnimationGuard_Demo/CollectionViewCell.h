//
//  CollectionViewCell.h
//  XianYu_AnimationGuard_Demo
//
//  Created by admin on 16/7/13.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <UIKit/UIKit.h>


#define PlayFinishedNotify @"PlayFinishedNotify"


@interface CollectionViewCell : UICollectionViewCell

/** startImage */
@property (nonatomic, strong)  UIImage * _Nonnull startImage;

/** 视频路径 */
@property (nonatomic, strong) NSString * _Nonnull moviePath;

@end
