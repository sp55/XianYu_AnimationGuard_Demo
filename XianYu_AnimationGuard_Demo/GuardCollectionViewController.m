//
//  GuardCollectionViewController.m
//  XianYu_AnimationGuard_Demo
//
//  Created by admin on 16/7/13.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "GuardCollectionViewController.h"
#import "FlowLayout.h"
#import "CollectionViewCell.h"
#import "ViewController.h"
@interface GuardCollectionViewController ()
/** pageControl */
@property (nonatomic, strong) UIPageControl *pageControl;
/** 当前视频是否播放完成 */
@property (nonatomic, assign, getter=isMovieFinished) BOOL movieFinished;
@end

@implementation GuardCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
#pragma mark - lazy loading
- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        CGFloat width = 120;
        CGFloat height = 30;
        CGFloat x = (MS_Width - width) * 0.5;
        CGFloat y = MS_Height - 30 - 20;
        UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(x, y, width, height)];
        pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        [Key_Window addSubview:pageControl];
        
        _pageControl = pageControl;
    }
    return _pageControl;
}

- (instancetype)init
{
    return [super initWithCollectionViewLayout:[[FlowLayout alloc] init]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.pageControl.numberOfPages = self.guideImagesArr.count;
}

- (void)dealloc
{
    [self.pageControl removeFromSuperview];
    self.pageControl = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - private method

- (void)setup
{
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieFinished) name:PlayFinishedNotify object:nil];
}

- (void)movieFinished
{
    self.movieFinished = YES;
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.guideImagesArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.startImage = [UIImage imageNamed:self.guideImagesArr[indexPath.row]];
    cell.moviePath = self.guideMoviePathArr[indexPath.row];
    self.movieFinished = NO;
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.guideImagesArr.count - 1 && self.isMovieFinished) {
        if (self.lastOnePlayFinished) {
            self.lastOnePlayFinished();
        }
    }
}

#pragma mark <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    uint page = (scrollView.contentOffset.x / scrollView.bounds.size.width) + 0.5;
    self.pageControl.currentPage = page;
}
@end
