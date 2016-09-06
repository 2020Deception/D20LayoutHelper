//
//  D2LayoutHelper.m
//  Pods
//
//  Created by Brian Bowman on 9/6/16.
//
//

#import "D20LayoutHelper.h"

@implementation D20LayoutHelper

/*!
 this function translatesAutoresizingMaskIntoConstraints to NO and adds the subviews to the superview
 @param superview the superview
 @param subviews the subviews
 */
+ (void)prepViewsWithSuperview:(UIView *)superview subviews:(NSArray<UIView *> *)subviews {
    for (UIView *view in subviews) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [superview addSubview:view];
    }
}

+ (NSArray<NSLayoutConstraint *> *)pinItemToTopWithSuperView:(UIView *)superview subview:(UIView *)subview height:(CGFloat)height {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    
    [[subview.leftAnchor constraintEqualToAnchor:superview.leftAnchor] setActive:YES];
    [[subview.rightAnchor constraintEqualToAnchor:superview.rightAnchor] setActive:YES];
    [[subview.topAnchor constraintEqualToAnchor:superview.topAnchor] setActive:YES];
    
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@",
                                  [NSNumber numberWithUnsignedInteger:subview.hash].stringValue];
    
    NSDictionary *viewsDictionary = @{hashedViewString : subview};
    
    NSArray<NSLayoutConstraint *> *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:
                                                          [NSString stringWithFormat:@"V:[%@(==%f)]", hashedViewString, height]
                                                                                                 options:0
                                                                                                 metrics:nil
                                                                                                   views:viewsDictionary];
    
    [NSLayoutConstraint activateConstraints:verticalConstraints];
    
    return verticalConstraints;
}

+ (void)widthHeightEquivalentsConstraintsWithSuperView:(UIView *)superview
                                               subview:(UIView *)subview {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    [[subview.leftAnchor constraintEqualToAnchor:superview.leftAnchor] setActive:YES];
    [[subview.rightAnchor constraintEqualToAnchor:superview.rightAnchor] setActive:YES];
    [[subview.topAnchor constraintEqualToAnchor:superview.topAnchor] setActive:YES];
    [[subview.bottomAnchor constraintEqualToAnchor:superview.bottomAnchor] setActive:YES];
}

+ (void)evenVerticalConstraintsWithSuperView:(UIView *)superview
                                    subviews:(NSArray<UIView *> *)subviews {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:subviews];
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:subviews];
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.axis = UILayoutConstraintAxisVertical;
    
    [superview addSubview:stackView];
    
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [D20LayoutHelper widthHeightEquivalentsConstraintsWithSuperView:superview subview:stackView];
}

+ (void)evenHorizontalConstraintsWithSuperView:(UIView *)superview
                                      subviews:(NSArray<UIView *> *)subviews {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:subviews];
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:subviews];
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.axis = UILayoutConstraintAxisHorizontal;
    
    [superview addSubview:stackView];
    
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [D20LayoutHelper widthHeightEquivalentsConstraintsWithSuperView:superview subview:stackView];
}

+ (NSArray<NSLayoutConstraint *> *)pinItemtoCenterOfSuperView:(UIView *)superview
                                                      subview:(UIView *)subview
                                                        width:(CGFloat)width
                                                       height:(CGFloat)height {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@",
                                  [NSNumber numberWithUnsignedInteger:subview.hash].stringValue];
    
    NSDictionary *viewsDictionary = @{hashedViewString : subview};
    
    NSArray<NSLayoutConstraint *> *constraintsH = [NSLayoutConstraint constraintsWithVisualFormat:
                                                   [NSString stringWithFormat:@"V:[%@(==%f)]", hashedViewString, height]
                                                                                          options:0
                                                                                          metrics:nil
                                                                                            views:viewsDictionary];
    
    NSArray<NSLayoutConstraint *> *constraintsW = [NSLayoutConstraint constraintsWithVisualFormat:
                                                   [NSString stringWithFormat:@"[%@(==%f)]", hashedViewString, width]
                                                                                          options:0
                                                                                          metrics:nil
                                                                                            views:viewsDictionary];
    
    NSLayoutConstraint *constraintX = [NSLayoutConstraint constraintWithItem:subview
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:superview
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1
                                                                    constant:1];
    
    NSLayoutConstraint *constraintY = [NSLayoutConstraint constraintWithItem:subview
                                                                   attribute:NSLayoutAttributeCenterY
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:superview
                                                                   attribute:NSLayoutAttributeCenterY
                                                                  multiplier:1
                                                                    constant:0];
    
    NSArray *constraints = [NSArray arrayWithArray:[[[constraintsH
                                                      arrayByAddingObjectsFromArray:constraintsW]
                                                     arrayByAddingObject:constraintX]
                                                    arrayByAddingObject:constraintY]];
    
    [NSLayoutConstraint activateConstraints:constraints];
    
    return constraints;
}

+ (NSArray<NSLayoutConstraint *> *)constraintsForWidthAndHeightOnSuperView:(UIView *)superview
                                                                forSubview:(UIView *)subview
                                                                     width:(CGFloat)width
                                                                    height:(CGFloat)height {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@",
                                  [NSNumber numberWithUnsignedInteger:subview.hash].stringValue];
    
    NSDictionary *viewsDictionary = @{hashedViewString : subview};
    
    NSArray<NSLayoutConstraint *> *constraintsH = [NSLayoutConstraint constraintsWithVisualFormat:
                                                   [NSString stringWithFormat:@"V:[%@(==%f)]", hashedViewString, height]
                                                                                          options:0
                                                                                          metrics:nil
                                                                                            views:viewsDictionary];
    
    NSArray<NSLayoutConstraint *> *constraintsW = [NSLayoutConstraint constraintsWithVisualFormat:
                                                   [NSString stringWithFormat:@"[%@(==%f)]", hashedViewString, width]
                                                                                          options:0
                                                                                          metrics:nil
                                                                                            views:viewsDictionary];
    
    NSArray *constraints = [NSArray arrayWithArray:[constraintsH arrayByAddingObjectsFromArray:constraintsW]];
    
    [NSLayoutConstraint activateConstraints:constraints];
    
    return constraints;
}

@end
