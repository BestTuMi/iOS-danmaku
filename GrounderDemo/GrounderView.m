//
//  GrounderView.m
//  GrounderDemo
//
//  Created by 贾楠 on 16/3/8.
//  Copyright © 2016年 贾楠. All rights reserved.
//

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
        self.isShow = YES;
        self.layer.cornerRadius = [GrounderView translationWithOriginalNum:30]/2;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        
        titleLabel = [[UILabel alloc] init];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize:[GrounderView translationWithOriginalNum:14]];
        [self addSubview:titleLabel];
        
        nameLabel = [[UILabel alloc] init];
        nameLabel.font = [UIFont systemFontOfSize:[GrounderView translationWithOriginalNum:12]];
        [self addSubview:nameLabel];
     
        headImage = [[UIImageView alloc] init];
        headImage.frame = CGRectMake(0, 0, [GrounderView translationWithOriginalNum:30], [GrounderView translationWithOriginalNum:30]);
        headImage.layer.cornerRadius = [GrounderView translationWithOriginalNum:30]/2;
        headImage.layer.borderWidth = 0.5;
        headImage.layer.borderColor = [UIColor whiteColor].CGColor;
        headImage.backgroundColor = [UIColor redColor];
        [self addSubview:headImage];
    }
    return self;
}

- (void)setContent:(id *)model{
    nameLabel.text = @"冰雪嫁芳好看";
    nameLabel.frame = CGRectMake([GrounderView translationWithOriginalNum:35], 2, [GrounderView calculateMsgWidth:nameLabel.text andWithLabelFont:[UIFont systemFontOfSize:[GrounderView translationWithOriginalNum:12]] andWithHeight:[GrounderView translationWithOriginalNum:10]], [GrounderView translationWithOriginalNum:10]);
    
    [headImage setImage:nil];
    
    titleLabel.text = @"好看好看看好看啊飒飒";
    titleLabel.frame = CGRectMake([GrounderView translationWithOriginalNum:35], [GrounderView translationWithOriginalNum:12], [GrounderView calculateMsgWidth:titleLabel.text andWithLabelFont:[UIFont systemFontOfSize:[GrounderView translationWithOriginalNum:14]] andWithHeight:[GrounderView translationWithOriginalNum:18]], [GrounderView translationWithOriginalNum:18]);
    
    viewWidth = titleLabel.frame.size.width + [GrounderView translationWithOriginalNum:50];
    if (nameLabel.frame.size.width > titleLabel.frame.size.width) {
        viewWidth = nameLabel.frame.size.width + [GrounderView translationWithOriginalNum:50];
    }
    switch (self.index % 4) {
        case 0:
            self.frame = CGRectMake(kScreenWidth + 20, [GrounderView translationWithOriginalNum:105], viewWidth, [GrounderView translationWithOriginalNum:30]);
            break;
        case 1:
            self.frame = CGRectMake(kScreenWidth + 20, [GrounderView translationWithOriginalNum:70], viewWidth, [GrounderView translationWithOriginalNum:30]);
            break;
        case 2:
            self.frame = CGRectMake(kScreenWidth + 20, [GrounderView translationWithOriginalNum:35], viewWidth, [GrounderView translationWithOriginalNum:30]);
            break;
        case 3:
            self.frame = CGRectMake(kScreenWidth + 20, 0, viewWidth, [GrounderView translationWithOriginalNum:30]);
            break;
        default:
            break;
    }

}

- (void)grounderAnimation{
    [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(timeOut) userInfo:nil repeats:NO];
    [UIView animateWithDuration:10 animations:^{
        self.frame = CGRectMake( - kScreenWidth*3, self.frame.origin.y, viewWidth, [GrounderView translationWithOriginalNum:30]);
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)timeOut{
    self.isShow = NO;
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

+ (CGFloat)translationWithOriginalNum:(CGFloat)originaNum
{
    return kScreenWidth * originaNum / 320;
}
@end
