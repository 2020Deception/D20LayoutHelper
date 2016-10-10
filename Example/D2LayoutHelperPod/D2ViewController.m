//
//  D2ViewController.m
//  D2LayoutHelperPod
//
//  Created by Brian Bowman on 09/06/2016.
//  Copyright (c) 2016 Brian Bowman. All rights reserved.
//

#import "D2ViewController.h"

#import "D20LayoutHelper.h"

@interface D2ViewController ()

@end

@implementation D2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // set a view to match the superview
    UIView *green = [UIView new];
    green.backgroundColor = [UIColor greenColor];
    [D20LayoutHelper widthHeightEquivalentsConstraintsWithSuperView:self.view
                                                                                subview:green];
    
    [self addLabels];
    [self addMoreLabels];
    [self addTopBar];
    [self addBottomBar];
}
    
- (void)addBottomBar {
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = [UIColor purpleColor];
    
    UILabel *navTitle = [UILabel new];
    navTitle.text = @"add buttons/views/anything here";
    navTitle.textColor = [UIColor cyanColor];
    [navTitle sizeToFit];
    
    [D20LayoutHelper pinItemtoCenterOfSuperView:bottomView subview:navTitle];
    
    [D20LayoutHelper pinItemToBottomWithSuperView:self.view subview:bottomView height:60];
}
    
- (void)addTopBar {
    UIView *topView = [UIView new];
    topView.backgroundColor = [UIColor blackColor];
    
    UILabel *navTitle = [UILabel new];
    navTitle.text = @"navigation title here";
    navTitle.textColor = [UIColor blueColor];
    [navTitle sizeToFit];
    
    [D20LayoutHelper pinItemtoCenterOfSuperView:topView subview:navTitle];
    
    [D20LayoutHelper pinItemToTopWithSuperView:self.view subview:topView height:60];
    
    UIView *marginHighBar = [UIView new];
    marginHighBar.backgroundColor = [UIColor yellowColor];
    
    [D20LayoutHelper pinItemToTopByLayoutMarginsGuideWithSuperView:topView subview:marginHighBar height:8];
    
    UIView *marginLowBar = [UIView new];
    marginLowBar.backgroundColor = [UIColor yellowColor];
    
    [D20LayoutHelper pinItemToBottomByLayoutMarginsGuideWithSuperView:topView subview:marginLowBar height:8];
}

- (void)addLabels {
    // evenly display some labels vertically
    NSArray<UIView *> *views = [NSArray new];
    
    for (int i = 0;  i < 8; i++) {
        UILabel *someLabel = [UILabel new];
        someLabel.text = [NSString stringWithFormat:@"label #%d", i+1];
        someLabel.backgroundColor = [UIColor magentaColor];
        [someLabel sizeToFit];
        views = [views arrayByAddingObject:someLabel];
    }
    
    [D20LayoutHelper centeredItemsByLayoutMarginsGuideWithSuperView:self.view
                                                           subviews:views
                                                          alignment:UIStackViewAlignmentFill
                                                       distribution:UIStackViewDistributionFillEqually
                                                               axis:UILayoutConstraintAxisVertical
                                                            spacing:23];
}

- (void)addMoreLabels {
    // evenly display some boxes horizontally
    NSArray<UIView *> *views = [NSArray new];
    NSArray<UIColor *> *colors = @[
                                   [UIColor purpleColor],
                                   [UIColor orangeColor],
                                   [UIColor cyanColor],
                                   [UIColor yellowColor],
                                   [UIColor redColor]
                                   ];
    
    for (int i = 0;  i < 5; i++) {
        UILabel *someLabel = [UILabel new];
        someLabel.text = [NSString stringWithFormat:@"label #%d", i+1];
        someLabel.backgroundColor = colors[i];
        [someLabel sizeToFit];
        views = [views arrayByAddingObject:someLabel];
    }
    
    [D20LayoutHelper evenConstraintsByLayoutMarginsGuideWithSuperView:self.view
                                         subviews:views
                                        alignment:UIStackViewAlignmentCenter
                                     distribution:UIStackViewDistributionFillEqually
                                             axis:UILayoutConstraintAxisHorizontal
                                          spacing:0];
}


@end
