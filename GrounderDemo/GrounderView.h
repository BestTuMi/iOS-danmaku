//
//  GrounderView.h
//  GrounderDemo
//
//  Created by 贾楠 on 16/3/8.
//  Copyright © 2016年 贾楠. All rights reserved.
//
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#import <UIKit/UIKit.h>

@interface GrounderView : UIView
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) BOOL isShow;

- (void)setContent:(id *)model;
- (void)grounderAnimation;

//等比换算 按320为基数
+ (CGFloat)translationWithOriginalNum:(CGFloat)originaNum;
//固定高度求文字长度
+ (CGFloat)calculateMsgWidth:(NSString *)msg andWithLabelFont:(UIFont*)font andWithHeight:(NSInteger)height;
@end
