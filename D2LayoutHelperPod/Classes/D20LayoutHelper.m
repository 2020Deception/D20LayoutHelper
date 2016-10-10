//
//  D2LayoutHelper.m
//  Pods
//
//  Created by Brian Bowman on 9/6/16.
//
//

#import "D20LayoutHelper.h"

@implementation D20LayoutHelper

+ (NSArray<NSLayoutConstraint *> *)pinItemToTopWithSuperView:(UIView *)superview
                                                     subview:(UIView *)subview
                                                      height:(CGFloat)height {
    
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    
    [[subview.leadingAnchor constraintEqualToAnchor:superview.leadingAnchor] setActive:YES];
    [[subview.trailingAnchor constraintEqualToAnchor:superview.trailingAnchor] setActive:YES];
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

+ (NSArray<NSLayoutConstraint *> *)pinItemToTopWithTopLayoutMarginsGuideWithSuperView:(UIView *)superview
                                                     subview:(UIView *)subview
                                                      height:(CGFloat)height {
    
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    
    [[subview.leadingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.leadingAnchor] setActive:YES];
    [[subview.trailingAnchor constraintEqualToAnchor:superview.trailingAnchor] setActive:YES];
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

+ (NSArray<NSLayoutConstraint *> *)pinItemToTopWithTopLeadingTrailingLayoutMarginsGuideWithSuperView:(UIView *)superview
                                                                       subview:(UIView *)subview
                                                                        height:(CGFloat)height {
    
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    
    [[subview.leadingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.leadingAnchor] setActive:YES];
    [[subview.trailingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.trailingAnchor] setActive:YES];
    [[subview.topAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.topAnchor] setActive:YES];
    
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
    
    [[subview.leadingAnchor constraintEqualToAnchor:superview.leadingAnchor] setActive:YES];
    [[subview.trailingAnchor constraintEqualToAnchor:superview.trailingAnchor] setActive:YES];
    [[subview.topAnchor constraintEqualToAnchor:superview.topAnchor] setActive:YES];
    [[subview.bottomAnchor constraintEqualToAnchor:superview.bottomAnchor] setActive:YES];
}

+ (void)widthHeightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview
                                               subview:(UIView *)subview {
    
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    
    [[subview.leadingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.leadingAnchor] setActive:YES];
    [[subview.trailingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.trailingAnchor] setActive:YES];
    [[subview.topAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.topAnchor] setActive:YES];
    [[subview.bottomAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.bottomAnchor] setActive:YES];
}
    
+ (void)widthEquivalentsConstraintsWithSuperView:(UIView *)superview subview:(UIView *)subview {
    
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    
    [[subview.leadingAnchor constraintEqualToAnchor:superview.leadingAnchor] setActive:YES];
    [[subview.trailingAnchor constraintEqualToAnchor:superview.trailingAnchor] setActive:YES];
}
    
+ (void)widthEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview subview:(UIView *)subview {
    
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    
    [[subview.leadingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.leadingAnchor] setActive:YES];
    [[subview.trailingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.trailingAnchor] setActive:YES];
}
    
+ (void)heightEquivalentsConstraintsWithSuperView:(UIView *)superview subview:(UIView *)subview {
    
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    
    [[subview.topAnchor constraintEqualToAnchor:superview.topAnchor] setActive:YES];
    [[subview.bottomAnchor constraintEqualToAnchor:superview.bottomAnchor] setActive:YES];
}
    
+ (void)heightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview subview:(UIView *)subview {
    
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    
    [[subview.topAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.topAnchor] setActive:YES];
    [[subview.bottomAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.bottomAnchor] setActive:YES];
}

+ (void)evenConstraintsWithSuperView:(UIView *)superview
                                    subviews:(NSArray<UIView *> *)subviews
                                   alignment:(UIStackViewAlignment)alignment
                                distribution:(UIStackViewDistribution)distribution
                                axis:(UILayoutConstraintAxis)axis
                             spacing:(CGFloat)spacing {
    
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:subviews];
    
    UIStackView *stackView = [D20LayoutHelper stackviewWithSubviews:subviews
                                                          alignment:alignment
                                                       distribution:distribution
                                                               axis:axis
                                                            spacing:spacing];
    
    [D20LayoutHelper widthHeightEquivalentsConstraintsWithSuperView:superview subview:stackView];
}

+ (void)evenConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview
                                                        subviews:(NSArray<UIView *> *)subviews
                                                       alignment:(UIStackViewAlignment)alignment
                                                    distribution:(UIStackViewDistribution)distribution
                                                    axis:(UILayoutConstraintAxis)axis
                                                 spacing:(CGFloat)spacing {
    
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:subviews];
    
    UIStackView *stackView = [D20LayoutHelper stackviewWithSubviews:subviews
                                                          alignment:alignment
                                                       distribution:distribution
                                                               axis:axis
                                                            spacing:spacing];
    
    [D20LayoutHelper widthHeightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:superview subview:stackView];
}
    
+ (NSArray<NSLayoutConstraint *> *)centeredItemsWithSuperView:(UIView *)superview
                          subviews:(NSArray<UIView *> *)subviews
                         alignment:(UIStackViewAlignment)alignment
                      distribution:(UIStackViewDistribution)distribution
                              axis:(UILayoutConstraintAxis)axis
                           spacing:(CGFloat)spacing {
    
    UIStackView *stackView = [D20LayoutHelper stackviewWithSubviews:subviews
                                                          alignment:alignment
                                                       distribution:distribution
                                                               axis:axis
                                                            spacing:spacing];
    
    [D20LayoutHelper widthEquivalentsConstraintsWithSuperView:superview subview:stackView];
    
    NSArray<NSLayoutConstraint *> *constraints = [D20LayoutHelper pinItemtoCenterOfSuperView:superview subview:stackView];
    
    return constraints;
}
    
+ (NSArray<NSLayoutConstraint *> *)centeredItemsByLayoutMarginsGuideWithSuperView:(UIView *)superview
                                              subviews:(NSArray<UIView *> *)subviews
                                             alignment:(UIStackViewAlignment)alignment
                                          distribution:(UIStackViewDistribution)distribution
                                                  axis:(UILayoutConstraintAxis)axis
                                               spacing:(CGFloat)spacing {
    
    UIStackView *stackView = [D20LayoutHelper stackviewWithSubviews:subviews
                                                          alignment:alignment
                                                       distribution:distribution
                                                               axis:axis
                                                            spacing:spacing];
    
    [D20LayoutHelper widthEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:superview subview:stackView];
    
    NSArray<NSLayoutConstraint *> *constraints = [D20LayoutHelper pinItemtoCenterOfSuperView:superview subview:stackView];
    
    return constraints;
}
    
+ (NSArray<NSLayoutConstraint *> *)pinItemtoCenterOfSuperView:(UIView *)superview
                                                      subview:(UIView *)subview {
    
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    
    NSLayoutConstraint *constraintX = [NSLayoutConstraint constraintWithItem:subview
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:superview
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1
                                                                    constant:0];
    
    NSLayoutConstraint *constraintY = [NSLayoutConstraint constraintWithItem:subview
                                                                   attribute:NSLayoutAttributeCenterY
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:superview
                                                                   attribute:NSLayoutAttributeCenterY
                                                                  multiplier:1
                                                                    constant:0];
    
    NSArray<NSLayoutConstraint *> *constraints = @[constraintX, constraintY];
    
    [NSLayoutConstraint activateConstraints:constraints];
    
    return constraints;
}

+ (NSArray<NSLayoutConstraint *> *)pinItemtoCenterOfSuperView:(UIView *)superview
                                                      subview:(UIView *)subview
                                                        width:(CGFloat)width
                                                       height:(CGFloat)height {
    
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    
    [D20LayoutHelper constraintsForWidthAndHeightOnSuperView:superview subview:superview width:width height:height];
    
    NSArray<NSLayoutConstraint *> *constraints = [D20LayoutHelper pinItemtoCenterOfSuperView:superview subview:subview];
    
    return constraints;
}

+ (NSArray<NSLayoutConstraint *> *)constraintsForWidthAndHeightOnSuperView:(UIView *)superview
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
    
    NSArray *constraints = [NSArray arrayWithArray:[constraintsH arrayByAddingObjectsFromArray:constraintsW]];
    
    [NSLayoutConstraint activateConstraints:constraints];
    
    return constraints;
}

#pragma mark - private functions 

/*!
 this function translatesAutoresizingMaskIntoConstraints to NO and adds the subviews to the superview
 @param superview the superview
 @param subviews the subviews
 */
+ (void)prepViewsWithSuperview:(UIView *)superview
                      subviews:(NSArray<UIView *> *)subviews {
    
    for (UIView *view in subviews) {
        
        if ([superview.subviews containsObject:view]) {
            continue;
        }
        
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [superview addSubview:view];
    }
}

/*!
 this function returns a stackview for use with the even distribution functions
 */
+ (UIStackView *)stackviewWithSubviews:(NSArray<UIView *> *)subviews
                             alignment:(UIStackViewAlignment)alignment
                          distribution:(UIStackViewDistribution)distribution
                                  axis:(UILayoutConstraintAxis)axis
                               spacing:(CGFloat)spacing {
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:subviews];
    stackView.alignment = alignment;
    stackView.distribution = distribution;
    stackView.axis = axis;
    stackView.spacing = spacing;
    
    return stackView;
}

@end
