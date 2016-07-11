//
//  XHQHeaderView.m
//  AutoHome
//
//  Created by tarena on 16/7/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQHeaderView.h"


@implementation XHQHeaderView
-(void)setAllImages:(NSArray *)allImages
{
    _allImages = allImages;
    [self setupNetWorkBannerView];
}


/**
 *  设置 网络 banner图
 */
- (void)setupNetWorkBannerView{
    NSMutableArray *imgArr = [NSMutableArray array];
    
    for (int i = 0; i < self.allImages.count; i++)
    {
        XHQCilceModel *model = self.allImages[i];
        NSString *path = model.image;
        [imgArr addObject:path];
    }
    
    // 设置 网络 轮播图
    KNBannerView *bannerView = [KNBannerView bannerViewWithNetWorkImagesArr:imgArr frame:self.bounds];
    bannerView.delegate = self;
    bannerView.placeHolder = @"3";
    bannerView.tag = 100;
    [self addSubview:bannerView];
}

/**
 *  设置 本地 banner图
 */
- (void)setupLocatioBannerView{
    NSString *img1 = @"1";
    NSString *img2 = @"2";
    NSString *img3 = @"3";
    NSString *img4 = @"4";
    NSString *img5 = @"5";
    NSArray *imgArr = [NSArray arrayWithObjects:img1,img2,img3,img4,img5, nil];
    
    // 设置 本地 轮播图
    KNBannerView *bannerView = [KNBannerView bannerViewWithLocationImagesArr:imgArr frame:self.bounds];
    /****************************** == 描述文字 == ********************************/
//    NSString *string1 = @"这是本地图片";
//    NSString *string2 = @"如果觉得还不错";
//    NSString *string3 = @"记得给我点赞哦";
//    NSString *string4 = @"我会更加努力的";
//    NSString *string5 = @"谢谢大家的支持!";
//    NSMutableArray *IntroduceArr = [NSMutableArray array];
//    [IntroduceArr addObject:string1];
//    [IntroduceArr addObject:string2];
//    [IntroduceArr addObject:string3];
//    [IntroduceArr addObject:string4];
//    [IntroduceArr addObject:string5];
//    bannerView.IntroduceStringArr = IntroduceArr;
    bannerView.timeInterval = 3; // 图片轮播的时间间隔
//    bannerView.IntroduceTextFont = [UIFont systemFontOfSize:17];// 介绍文字字体大小
//    bannerView.IntroduceBackGroundAlpha = 1.0;// 介绍文字的透明度
//    bannerView.IntroduceBackGroundColor = [UIColor blackColor]; // 介绍文字的背景色
    //    bannerView.IntroduceHeight = 60;// 介绍文字的高度
//    bannerView.IntroduceTextColor = [UIColor orangeColor]; // 介绍文字的颜色
    bannerView.PageIndicatorTintColor = [UIColor whiteColor];// pageControl的 其他'点'的颜色
    bannerView.CurrentPageIndicatorTintColor = [UIColor orangeColor];// pageControl的 当前'点'的颜色
    bannerView.pageControlStyle = KNPageControlStyleRight;// pageControl 对其方式
//    bannerView.IntroduceStyle = KNIntroduceStyleRight;// 介绍文字的对其方式
    
    bannerView.delegate = self;
    bannerView.tag = 200;
    [self addSubview:bannerView];
}

- (void)bannerView:(KNBannerView *)bannerView collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSInteger)index{
    XHQCilceModel *model = self.allImages[index];
    NSString *path = model.topicUrl;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ImageNOtification" object:path];
}


@end
