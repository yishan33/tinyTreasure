//
//  ComplexCell.m
//  MutableCell
//
//  Created by Liu fushan on 15/7/20.
//  Copyright (c) 2015年 culturalCenter. All rights reserved.
//

#import "ComplexCell.h"
#import "Masonry/Masonry.h"
#import "UIView+FDCollapsibleConstraints.h"

@interface ComplexCell()

@property (nonatomic, strong) MASConstraint *cF; //constraint first row
@property (nonatomic, strong) MASConstraint *cB; //constraint blue
@property (nonatomic, strong) MASConstraint *cY; //constraint yellow
@property (nonatomic, strong) MASConstraint *cR; //constraint red
@property (nonatomic, strong) MASConstraint *cG; //constraint green

@property (nonatomic, strong) UIView *gF; //group first row
@property (nonatomic, strong) UIView *gB; //group blue
@property (nonatomic, strong) UIView *gY; //group yellow
@property (nonatomic, strong) UIView *gR; //group red
@property (nonatomic, strong) UIView *gG; //group green

@property (nonatomic, strong) UIView *vB; //view blue    height:30
@property (nonatomic, strong) UIView *vY; //view yellow  height:30
@property (nonatomic, strong) UIView *vR; //view red     height:30
@property (nonatomic, strong) UIView *vG; //view green   height:100

@end

@implementation ComplexCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    
    if (self) {
        
        CGFloat spacing = 20.0f;
        
        self.gF = [UIView new];
        [self.contentView addSubview:self.gF];
        [self.gF mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.top.right.equalTo(self.contentView);
            
            self.cF = make.height.equalTo(@0).priority(UILayoutPriorityRequired);
            [self.cF deactivate];
        }];
        self.gF.clipsToBounds = YES;
        
        self.gB = [UIView new];
        [self.gF addSubview:self.gB];
        [self.gB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.top.bottom.equalTo(self.gF);
            
            self.cB = make.width.equalTo(@0).priority(UILayoutPriorityRequired);
            [self.cB deactivate];
        }];
        self.gB.clipsToBounds = YES;
        
        self.gY = [UIView new];
        [self.gF addSubview:self.gY];
        [self.gY mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.right.bottom.equalTo(self.gF);
            make.left.equalTo(self.gB.mas_right);
            
            self.cY = make.width.equalTo(@0).priority(UILayoutPriorityRequired);
            [self.cY deactivate];
        }];
        self.gY.clipsToBounds = YES;
        
        self.gR = [UIView new];
        [self.contentView addSubview:self.gR];
        [self.gR mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.gF.mas_bottom);
            
            self.cR = make.height.equalTo(@0).priority(UILayoutPriorityRequired);
            [self.cR deactivate];
        }];
        self.gR.clipsToBounds = YES;
        
        self.gG = [UIView new];
        [self.contentView addSubview:self.gG];
        [self.gG mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.gR.mas_bottom);
            
            self.cG = make.height.equalTo(@0).priority(UILayoutPriorityRequired);
            [self.cG deactivate];
        }];
        self.gG.clipsToBounds = YES;
        
        self.vB = [UIView new];
        [self.gB addSubview:self.vB];
        [self.vB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.equalTo(self.gB).insets(UIEdgeInsetsMake(spacing, spacing, 0, 0)).priorityLow();
            make.width.equalTo(@60);
            make.height.equalTo(@30);
        }];
        [self.vB setBackgroundColor:[UIColor blueColor]];
        
        self.vY = [UIView new];
        [self.gY addSubview:self.vY];
        [self.vY mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.equalTo(self.gY).insets(UIEdgeInsetsMake(spacing, spacing, 0, spacing)).priorityLow();
            make.height.equalTo(@30);
        }];
        [self.vY setBackgroundColor:[UIColor yellowColor]];
        
        self.vR = [UIView new];
        [self.gR addSubview:self.vR];
        [self.vR mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.equalTo(self.gR).insets(UIEdgeInsetsMake(spacing, spacing, 0, spacing)).priorityLow();
            make.height.equalTo(@30);
        }];
        [self.vR setBackgroundColor:[UIColor redColor]];
        
        self.vG = [UIView new];
        [self.gG addSubview:self.vG];
        [self.vG mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.equalTo(self.gG).insets(UIEdgeInsetsMake(spacing, spacing, 0, spacing)).priorityLow();
            make.height.equalTo(@100);
        }];
        [self.vG setBackgroundColor:[UIColor greenColor]];
        
        
    }
    
    return self;
}

- (void)setType:(modelType)type {
    
    [self.cF deactivate];
    [self.cB deactivate];
    [self.cY deactivate];
    [self.cR deactivate];
    [self.cG deactivate];
    
    switch (type) {
            
        case modelTypeNoMiss:
            break;
            
        case modelTypeNoBlue:
            
            [self.cB activate];
            break;
        case modelTypeNoGreen:
            
            [self.cG activate];
            break;
        
        case modelTypeNoRed:
            
            [self.cR activate];
            break;
            
        case modelTypeNoYellow:
            
            [self.cY activate];
            break;
        
        default:
            break;
    }
}

+ (CGFloat)getHeightWithType:(modelType)type {
    
    CGFloat returnFloat;
    switch (type) {
        
        case modelTypeNoMiss:
            returnFloat = 20 + 30 + 20 + 30 + 20 + 100 + 20;
            break;
            
        case modelTypeNoBlue:
            returnFloat = 20 + 30 + 20 + 30 + 20 + 100 + 20;
            break;
        case modelTypeNoYellow:
            returnFloat = 20 + 30 + 20 + 30 + 20 + 100 + 20;
            break;
        case modelTypeNoRed:
            returnFloat = 20 + 30 + 20  + 100 + 20;
            break;
        case modelTypeNoGreen:
            returnFloat = 20 + 30 + 20 + 30  + 20;
        default:
            break;
    }
    
    return returnFloat;
}


@end
