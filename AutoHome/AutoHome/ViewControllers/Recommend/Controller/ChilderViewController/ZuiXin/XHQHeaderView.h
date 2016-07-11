//
//  XHQHeaderView.h
//  AutoHome
//
//  Created by tarena on 16/7/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KNBannerView.h"
#import "XHQCilceModel.h"

@interface XHQHeaderView : UIView<KNBannerViewDelegate>
@property (nonatomic,strong) NSArray *allImages;

@end
