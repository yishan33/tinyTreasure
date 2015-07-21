//
//  bindView.m
//  MutableCell
//
//  Created by Liu fushan on 15/7/21.
//  Copyright (c) 2015年 culturalCenter. All rights reserved.
//

#import "bindView.h"
#import "Masonry/Masonry.h"

@interface bindView ()

@property  int addCount;

@property (nonatomic, strong) UIView *downView;
@property (nonatomic, strong) UIView *rightView;

@end

@implementation bindView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)bindTwoViewHoriViewLeft:(UIView *)leftView viewRight:(UIView *)rightView leading:(CGFloat)leadingNumber binding:(CGFloat)bindingNumber {
    
    [self addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).offset(leadingNumber);
        make.centerY.equalTo(self.mas_centerY);
        make.width.equalTo([NSNumber numberWithFloat:leftView.frame.size.width]);
        make.height.equalTo([NSNumber numberWithFloat:leftView.frame.size.height]);
    }];

    [self addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(leftView.mas_right).offset(bindingNumber);
        make.centerY.equalTo(self.mas_centerY);
        make.width.equalTo([NSNumber numberWithFloat:rightView.frame.size.width]);
        make.height.equalTo([NSNumber numberWithFloat:rightView.frame.size.height]);
        
    }];
}

- (void)bindTwoViewVecViewTop:(UIView *)topView viewBottom:(UIView *)bottomView upInterval:(CGFloat)upIntervalNumber binding:(CGFloat)bindingNumber {
    
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_top).offset(upIntervalNumber);
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo([NSNumber numberWithFloat:topView.frame.size.width]);
        make.height.equalTo([NSNumber numberWithFloat:topView.frame.size.height]);
        
    }];
    
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(topView.mas_bottom).offset(bindingNumber);
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo([NSNumber numberWithFloat:bottomView.frame.size.width]);
        make.height.equalTo([NSNumber numberWithFloat:bottomView.frame.size.height]);
    }];
}

- (void)bindThreeViewVecViewTop:(UIView *)topView viewMiddle:(UIView *)middleView viewBottom:(UIView *)bottomView upInterval:(CGFloat)upIntervalNumber bindingOne:(CGFloat)bindingNumberOne bindingTwo:(CGFloat)bindingNumberTwo {
    
    [self setBounds:CGRectMake(0, 0, 80, 200)];
    [self bindTwoViewVecViewTop:topView viewBottom:middleView upInterval:upIntervalNumber binding:bindingNumberOne];
    
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(middleView.mas_bottom).offset(bindingNumberTwo);
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo([NSNumber numberWithFloat:bottomView.frame.size.width]);
        make.height.equalTo([NSNumber numberWithFloat:bottomView.frame.size.height]);
    }];
    
}

- (void)bindViewVecWithViewArray:(NSMutableArray *)viewArray bindNumberArray:(NSMutableArray *)numberArray markArray:(NSMutableArray *)markArray numberCount:(int)count
{

    if ((int)[viewArray count] == 1) {
    
        UIView *firstView = [viewArray lastObject];
        CGFloat firstBindingNumber = [[numberArray lastObject] floatValue];
        NSNumber *markNumber = [markArray lastObject];
        
        if ([markNumber intValue] == 1) {
            [self addSubview:firstView];
            [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(self.mas_top).offset(firstBindingNumber);
                make.centerX.equalTo(self.mas_centerX);
                make.width.equalTo([NSNumber numberWithFloat:firstView.frame.size.width]);
                make.height.equalTo([NSNumber numberWithFloat:firstView.frame.size.height]);
            }];
        } else if ([markNumber intValue] == 2) {
            
            [self addSubview:_downView];
            [self addSubview:firstView];
            [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.bottom.equalTo(_downView.mas_top).offset(-firstBindingNumber);
                make.centerX.equalTo(self.mas_centerX);
                make.width.equalTo([NSNumber numberWithFloat:firstView.frame.size.width]);
                make.height.equalTo([NSNumber numberWithFloat:firstView.frame.size.height]);

            }];
        }
        
    }
    if  ((int)[viewArray count] > 1) {
        
        NSMutableArray *viewArrayLess = viewArray;
        UIView *lastView = [viewArrayLess lastObject];
        [viewArrayLess removeLastObject];
        
        NSMutableArray *numberArrayLess = numberArray;
        CGFloat lastBindingNumber;
        lastBindingNumber = [[numberArrayLess lastObject] floatValue];
        [numberArrayLess removeLastObject];
        
        NSMutableArray *markArrayLess = markArray;
        NSNumber *markNumber = [markArrayLess lastObject];
        [markArrayLess removeLastObject];
        
        UIView *upView = [viewArrayLess lastObject];
        [self addSubview:upView];
        
        if (_downView != nil) {
            
            [self addSubview:_downView];
        }
        
        if ([markNumber intValue] == 1) {
           
            [self addSubview:lastView];
            [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(upView.mas_bottom).offset(lastBindingNumber);
                make.centerX.equalTo(self.mas_centerX);
                make.width.equalTo([NSNumber numberWithFloat:lastView.frame.size.width]);
                make.height.equalTo([NSNumber numberWithFloat:lastView.frame.size.height]);
            }];
        } else if ([markNumber intValue] == 2) {
            
            if ((int)[viewArray count] == count - 1) {
                
                [self addSubview:lastView];
                [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
                    
                    make.bottom.equalTo(self.mas_bottom).offset(-lastBindingNumber);
                    make.centerX.equalTo(self.mas_centerX);
                    make.width.equalTo([NSNumber numberWithFloat:lastView.frame.size.width]);
                    make.height.equalTo([NSNumber numberWithFloat:lastView.frame.size.height]);
                }];
                
            } else {
            
            [self addSubview:lastView];
            [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.bottom.equalTo(_downView.mas_top).offset(-lastBindingNumber);
                make.centerX.equalTo(self.mas_centerX);
                make.width.equalTo([NSNumber numberWithFloat:lastView.frame.size.width]);
                make.height.equalTo([NSNumber numberWithFloat:lastView.frame.size.height]);
            }];
            }
        }
        
        _downView = lastView;
        [self bindViewVecWithViewArray:viewArrayLess bindNumberArray:numberArrayLess markArray:markArrayLess numberCount:count];
    }
}
/**
 *  横向排列于背景视图中,各视图竖直中心(center.y)与背景视图保持一致
 *
 *  @param viewArray   添加于背景视图中的视图数组
 *  @param numberArray 视图约束条件数组
 *  @param markArray   视图布局方式数组
 *  @param count       视图个数
 */
- (void)bindViewHerWithViewArray:(NSMutableArray *)viewArray bindNumberArray:(NSMutableArray *)numberArray markArray:(NSMutableArray *)markArray numberCount:(int)count
{
    if ((int)[viewArray count] == 1) {
        
        UIView *firstView = [viewArray lastObject];
        CGFloat firstBindingNumber = [[numberArray lastObject] floatValue];
        NSNumber *markNumber = [markArray lastObject];
        
        if ([markNumber intValue] == 1) {
            [self addSubview:firstView];
            [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.left.equalTo(self.mas_left).offset(firstBindingNumber);
                make.centerY.equalTo(self.mas_centerY);
                make.width.equalTo([NSNumber numberWithFloat:firstView.frame.size.width]);
                make.height.equalTo([NSNumber numberWithFloat:firstView.frame.size.height]);
            }];
        } else if ([markNumber intValue] == 2) {
            
            [self addSubview:_rightView];
            [self addSubview:firstView];
            [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.right.equalTo(_rightView.mas_left).offset(-firstBindingNumber);
                make.centerY.equalTo(self.mas_centerY);
                make.width.equalTo([NSNumber numberWithFloat:firstView.frame.size.width]);
                make.height.equalTo([NSNumber numberWithFloat:firstView.frame.size.height]);
                
            }];
        }
        
    }
    if  ((int)[viewArray count] > 1) {
        
        NSMutableArray *viewArrayLess = viewArray;
        UIView *lastView = [viewArrayLess lastObject];
        [viewArrayLess removeLastObject];
        
        NSMutableArray *numberArrayLess = numberArray;
        CGFloat lastBindingNumber;
        lastBindingNumber = [[numberArrayLess lastObject] floatValue];
        [numberArrayLess removeLastObject];
        
        NSMutableArray *markArrayLess = markArray;
        NSNumber *markNumber = [markArrayLess lastObject];
        [markArrayLess removeLastObject];
        
        UIView *leftView = [viewArrayLess lastObject];
        [self addSubview:leftView];
        
        if (_rightView != nil) {
            
            [self addSubview:_rightView];
        }
        
        if ([markNumber intValue] == 1) {
            
            [self addSubview:lastView];
            [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.left.equalTo(leftView.mas_right).offset(lastBindingNumber);
                make.centerY.equalTo(self.mas_centerY);
                make.width.equalTo([NSNumber numberWithFloat:lastView.frame.size.width]);
                make.height.equalTo([NSNumber numberWithFloat:lastView.frame.size.height]);
            }];
        } else if ([markNumber intValue] == 2) {
            
            if ((int)[viewArray count] == count - 1) {
                
                [self addSubview:lastView];
                [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
                    
                    make.right.equalTo(self.mas_right).offset(-lastBindingNumber);
                    make.centerY.equalTo(self.mas_centerY);
                    make.width.equalTo([NSNumber numberWithFloat:lastView.frame.size.width]);
                    make.height.equalTo([NSNumber numberWithFloat:lastView.frame.size.height]);
                }];
                
            } else {
                
                [self addSubview:lastView];
                [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
                    
                    make.right.equalTo(_rightView.mas_left).offset(-lastBindingNumber);
                    make.centerY.equalTo(self.mas_centerY);
                    make.width.equalTo([NSNumber numberWithFloat:lastView.frame.size.width]);
                    make.height.equalTo([NSNumber numberWithFloat:lastView.frame.size.height]);
                }];
            }
        }
        
        _rightView = lastView;
        [self bindViewHerWithViewArray:viewArrayLess bindNumberArray:numberArrayLess markArray:markArrayLess numberCount:count];
    }
}


- (void)bindViewHerAndBottmWithViewArray:(NSMutableArray *)viewArray bindNumberArray:(NSMutableArray *)numberArray markArray:(NSMutableArray *)markArray numberCount:(int)count topInterval:(CGFloat)interval
{
    
    CGFloat viewWidth = self.frame.size.width;
    CGFloat viewHeight = 0.0;
    for (UIView *itemView in viewArray) {
        if (itemView.frame.size.height > viewHeight) {
            viewHeight = itemView.frame.size.height;
        }
    }
    
    bindView *tinyView = [bindView new];
    [tinyView setFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
    [tinyView bindViewHerWithViewArray:viewArray bindNumberArray:numberArray markArray:markArray numberCount:count];
    [self addSubview:tinyView];
    [tinyView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(interval, 0, 0, 0));
        
    }];
    
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, viewHeight + interval)];
}



@end
