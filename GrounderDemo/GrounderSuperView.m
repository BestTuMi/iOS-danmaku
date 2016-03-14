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
    NSMutableArray *modelArray;
    NSInteger grounderCount;
}
@end
@implementation GrounderSuperView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        grounderArray = [[NSMutableArray alloc] init];
        modelArray = [[NSMutableArray alloc] init];
        grounderCount = 0;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nextView:) name:@"nextView" object:nil];

        for (int i = 0; i < 4; i++) {
            GrounderView *grounder = [[GrounderView alloc] init];
            grounder.isShow = NO;
            grounder.index = i;
            [grounderArray addObject:grounder];
        }
    }
    return self;
}

- (void)setModel:(ChatData *)model{
    [modelArray addObject:model];
    [self checkView];
}

- (void)nextView:(NSNotification *)notification{
    [self checkView];
}

- (void)checkView{
    if (modelArray.count == 0) {
        return;
    }
    __weak GrounderSuperView *this = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        for (GrounderView *view in grounderArray) {
            if (view.isShow == NO) {
                switch (view.index) {
                    case 0:
                        view.selfYposition = 105;
                        break;
                    case 1:
                        view.selfYposition = 70;
                        break;
                    case 2:
                        view.selfYposition = 35;
                        break;
                    case 3:
                        view.selfYposition = 0;
                        break;
                    default:
                        break;
                }
                view.isShow = YES;
                [view setContent:modelArray[0]];
                [this addSubview:view];
                [view grounderAnimation:modelArray[0]];

                [modelArray removeObjectAtIndex:0];
                break;
            }
        }
    });
}
@end
