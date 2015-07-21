//
//  ComplexCell.h
//  MutableCell
//
//  Created by Liu fushan on 15/7/20.
//  Copyright (c) 2015年 culturalCenter. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, modelType) {
    
    modelTypeNoMiss,
    modelTypeNoBlue,
    modelTypeNoYellow,
    modelTypeNoRed,
    modelTypeNoGreen
    
};


@interface ComplexCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

- (void)setType:(modelType)type;
+ (CGFloat)getHeightWithType:(modelType)type;


@end
