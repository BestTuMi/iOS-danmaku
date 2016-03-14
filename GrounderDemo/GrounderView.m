//
//  GrounderView.m
//  GrounderDemo
//
//  Created by 贾楠 on 16/3/8.
//  Copyright © 2016年 贾楠. All rights reserved.
//
#import "UIColor+Hex.h"
#import "GrounderView.h"
@interface GrounderView()
{
    UILabel * titleLabel;
    UIImageView * headImage;
    UILabel * nameLabel;
    float viewWidth;
}
@end
@implementation GrounderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 30/2;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        
        titleLabel = [[UILabel alloc] init];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:12];
        [self addSubview:titleLabel];
        
        nameLabel = [[UILabel alloc] init];
        nameLabel.textColor = k69Red;
        nameLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:nameLabel];
     
        headImage = [[UIImageView alloc] init];
        headImage.clipsToBounds = YES;
        headImage.frame = CGRectMake(0, 0, 30, 30);
        headImage.layer.cornerRadius = 30/2;
        headImage.layer.borderWidth = 0.5;
        headImage.layer.borderColor = [UIColor whiteColor].CGColor;
        [self addSubview:headImage];
    }
    return self;
}

- (void)setContent:(ChatData *)model{

        nameLabel.text = model.firstName;
        nameLabel.frame = CGRectMake(35, 2, [GrounderView calculateMsgWidth:nameLabel.text andWithLabelFont:[UIFont systemFontOfSize:10] andWithHeight:10], 10);
        
        [headImage setImageWithURL:[NSURL URLWithString:model.srcheadimage]];
        
        titleLabel.text = model.contentStr;
        titleLabel.frame = CGRectMake(35, 12, [GrounderView calculateMsgWidth:titleLabel.text andWithLabelFont:[UIFont systemFontOfSize:12] andWithHeight:18], 18);
        
        viewWidth = titleLabel.frame.size.width + 55;
        if (nameLabel.frame.size.width > titleLabel.frame.size.width) {
            viewWidth = nameLabel.frame.size.width + 55;
        }

        self.frame = CGRectMake(kScreenWidth + 20, self.selfYposition, viewWidth, 30);
    
}

- (void)grounderAnimation:(ChatData *)model{
    float second = 0.0;
    if (model.contentStr.length < 30){
        second = 10.0f;
    }else{
        second = model.contentStr.length/2.5;
    }
    
    [UIView animateWithDuration:second animations:^{
        self.frame = CGRectMake( - viewWidth - 20, self.frame.origin.y, viewWidth, 30);
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
        self.isShow = NO;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"nextView" object:nil];
    }];
}

+ (CGFloat)calculateMsgWidth:(NSString *)msg andWithLabelFont:(UIFont*)font andWithHeight:(NSInteger)height {
    if ([msg isEqualToString:@""]) {
        return 0;
    }
    CGFloat messageLableWidth = [msg boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:font}
                                                  context:nil].size.width;
    return messageLableWidth + 1;
}

@end
