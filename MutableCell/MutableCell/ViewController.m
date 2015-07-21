//
//  ViewController.m
//  MutableCell
//
//  Created by Liu fushan on 15/7/20.
//  Copyright (c) 2015年 culturalCenter. All rights reserved.
//

#import "ViewController.h"
#import "ComplexCell.h"
#import "Masonry.h"
#import "UIView+FDCollapsibleConstraints.h"
#import "bindView.h"

#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>


//@property (nonatomic, strong) MASConstraint *cF; //constraint first row
//@property (nonatomic, strong) MASConstraint *cB; //constraint blue
//@property (nonatomic, strong) MASConstraint *cY; //constraint yellow
//@property (nonatomic, strong) MASConstraint *cR; //constraint red
//@property (nonatomic, strong) MASConstraint *cG; //constraint green

@property (nonatomic, strong) ComplexCell *cell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   
    UITableView *table = [[UITableView alloc] init];
    [table setFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    table.delegate = self;
    table.dataSource = self;
    
//    [self.view addSubview:table];
    
   
//    _cell = [[ComplexCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    [_cell setType:modelTypeNoMiss];
//    
//    CGFloat cellHeight = [ComplexCell getHeightWithType:modelTypeNoMiss];
//    [_cell setFrame:CGRectMake(0, 200, WIDTH, cellHeight)];
//    
//    [self.view addSubview:_cell];

    
    UILabel *viewOne = [UILabel new];
    [viewOne setText:@"xiha"];
    [viewOne setTextColor:[UIColor redColor]];
    [viewOne setBackgroundColor:[UIColor blackColor]];
    [viewOne setFrame:CGRectMake(0, 0, 60, 60)];
    
    UIView *viewTwo = [UIView new];
    [viewTwo setBackgroundColor:[UIColor orangeColor]];
    [viewTwo setFrame:CGRectMake(0, 0, 80, 40)];
    
    UIView *viewThree = [UIView new];
    [viewThree setBackgroundColor:[UIColor greenColor]];
    [viewThree setFrame:CGRectMake(0, 0, 40, 40)];
    
    NSMutableArray *viewArray =  [NSMutableArray arrayWithObjects:viewOne, viewTwo, viewThree, nil];
    NSMutableArray *bindNumberArray = [NSMutableArray arrayWithObjects:@10, @20, @10, nil];
    NSMutableArray *markArray = [NSMutableArray arrayWithObjects:@1, @1, @2, nil];
    
    bindView *myView = [bindView new];
    [myView setFrame:CGRectMake(50, 100, 300, 300)];
    [myView setBackgroundColor:[UIColor yellowColor]];
    [myView bindViewHerAndBottmWithViewArray:viewArray bindNumberArray:bindNumberArray markArray:markArray numberCount:3 topInterval:10];
//    [myView bindViewVecWithViewArray:viewArray bindNumberArray:bindNumberArray markArray:markArray numberCount:3];
//    [myView bindViewVecWithViewArray:viewArray bindNumberArray:bindNumberArray numberCount:3];
    
    [self.view addSubview:myView];
//    bindView *myView = [bindView new];
//    [myView setFrame:CGRectMake(100, 100, 0, 0)];
//    [myView setBackgroundColor:[UIColor yellowColor]];
////    [self.view addSubview:myView];
//    [myView bindThreeViewVecViewTop:viewOne viewMiddle:viewTwo viewBottom:viewThree upInterval:spacing bindingOne:spacing bindingTwo:spacing];
//    
//    UIView *viewFour = [UIView new];
//    [viewFour setBackgroundColor:[UIColor grayColor]];
//    [viewFour setFrame:CGRectMake(0, 0, 100, 60)];
//    
//    bindView *bigView = [bindView new];
//    [bigView setFrame:CGRectMake(100, 100, 200, 300)];
//    [bigView bindTwoViewVecViewTop:myView viewBottom:viewFour upInterval:spacing binding:spacing];
//    [self.view addSubview:bigView];
    
    
  
}

- (void)changeView {
    
//    [UIView animateWithDuration:3.0 animations:^{
//        
//        
//        [self.view layoutSubviews];
//    }];
    
    [UIView animateWithDuration:1.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveLinear animations:^{
        [_cell setType:modelTypeNoRed];
    } completion:^(BOOL finished) {
        nil;
    }];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
