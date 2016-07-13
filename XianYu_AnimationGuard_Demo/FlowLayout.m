//
//  FlowLayout.m
//  XianYu_AnimationGuard_Demo
//
//  Created by admin on 16/7/13.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "FlowLayout.h"

@implementation FlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.itemSize = self.collectionView.bounds.size;
    
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
}

@end
