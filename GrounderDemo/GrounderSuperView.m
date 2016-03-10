//
//  GrounderSuperView.m
//  GrounderDemo
//
//  Created by 贾楠 on 16/3/10.
//  Copyright © 2016年 贾楠. All rights reserved.
//

#import "GrounderSuperView.h"
#import "GrounderView.h"
@interface GrounderSuperView()
{
    NSMutableArray *grounderArray;
    NSInteger grounderCount;
    GrounderView *grounder;
}
@end
@implementation GrounderSuperView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        grounderArray = [[NSMutableArray alloc] init];
        grounderCount = 0;
    }
    return self;
}

- (void)setModel:(id)model{
    if (grounderCount % 4 == 0 && grounderCount != 0 && ((GrounderView *)grounderArray[grounderCount - 4]).isShow == YES) {
        
    }else{
        [self addGrounderView:nil];
    }
}
- (void)addGrounderView:(id)model{
    
    grounder = [[GrounderView alloc] init];
    [grounderArray addObject: grounder];
    grounder.index = grounderCount;
    [grounderArray[grounderCount] setContent: nil];
    [self addSubview: grounder];
    [grounderArray[grounderCount] grounderAnimation];
    
    grounderCount = grounderCount + 1;
}

@end
