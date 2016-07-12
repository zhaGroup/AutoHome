//
//  XHQZuiXinCell.m
//  AutoHome
//
//  Created by tarena on 16/7/9.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQZuiXinCell.h"

@interface XHQZuiXinCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *zuiXinTitle;
@property (weak, nonatomic) IBOutlet UILabel *count;
@property (weak, nonatomic) IBOutlet UILabel *pubDate;

@end

@implementation XHQZuiXinCell
-(void)setModel:(XHQZuiXinModel *)model
{
    _model = model;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.image]];
    self.zuiXinTitle.text = model.title;
    if ([model.count isEqualToString:@"0"]) {
        self.count.text = @"抢沙发";
    }else{
        self.count.text = [NSString stringWithFormat:@"%@评论",model.count];
    }
    self.pubDate.text = model.pubDate;
    
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
