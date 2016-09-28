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
    [D20LayoutHelper widthHeightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:self.view
                                                                                subview:green];
    
    [self addLabels];
//    [self addMoreLabels];
}

- (void)addLabels {
    // evenly display some labels vertically
    NSArray<UIView *> *views = [NSArray new];
    for (int i = 0;  i < 25; i++) {
        UILabel *someLabel = [UILabel new];
        someLabel.text = [NSString stringWithFormat:@"label #%d", i+1];
        [someLabel sizeToFit];
        views = [views arrayByAddingObject:someLabel];
    }
    
    [D20LayoutHelper evenConstraintsByLayoutMarginsGuideWithSuperView:self.view
                                                             subviews:views
                                                            alignment:UIStackViewAlignmentFill
                                                         distribution:UIStackViewDistributionFillEqually
                                                                 axis:UILayoutConstraintAxisVertical];
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
    
    [D20LayoutHelper evenConstraintsWithSuperView:self.view
                                                   subviews:views
                                                  alignment:UIStackViewAlignmentCenter
                                               distribution:UIStackViewDistributionFillEqually
                                             axis:UILayoutConstraintAxisHorizontal];
}


@end
