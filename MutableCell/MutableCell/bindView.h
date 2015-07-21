//
//  bindView.h
//  MutableCell
//
//  Created by Liu fushan on 15/7/21.
//  Copyright (c) 2015年 culturalCenter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bindView : UIView

- (void)bindTwoViewHoriViewLeft:(UIView *)leftView viewRight:(UIView *)rightView leading:(CGFloat)leadingNumber binding:(CGFloat)bindingNumber;

- (void)bindTwoViewVecViewTop:(UIView *)topView viewBottom:(UIView *)bottomView upInterval:(CGFloat)upIntervalNumber binding:(CGFloat)bindingNumber;

- (void)bindThreeViewVecViewTop:(UIView *)topView viewMiddle:(UIView *)middleView viewBottom:(UIView *)bottomView upInterval:(CGFloat)upIntervalNumber bindingOne:(CGFloat)bindingNumberOne bindingTwo:(CGFloat)bindingNumberTwo;

- (void)bindViewVecWithViewArray:(NSMutableArray *)viewArray bindNumberArray:(NSMutableArray *)numberArray markArray:(NSMutableArray *)markArray numberCount:(int)count;

- (void)bindViewHerWithViewArray:(NSMutableArray *)viewArray bindNumberArray:(NSMutableArray *)numberArray markArray:(NSMutableArray *)markArray numberCount:(int)count;

- (void)bindViewHerAndBottmWithViewArray:(NSMutableArray *)viewArray bindNumberArray:(NSMutableArray *)numberArray markArray:(NSMutableArray *)markArray numberCount:(int)count topInterval:(CGFloat)interval;


@end
