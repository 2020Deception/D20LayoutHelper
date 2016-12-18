//
//  D2LayoutHelper.m
//  Pods
//
//  Created by Brian Bowman on 9/6/16.
//
//

#import "D20LayoutHelper.h"

@implementation D20LayoutHelper

static float zeroConstants[] = { 0.0f, 0.0f, 0.0f, 0.0f };

+ (void)widthHeightEquivalentsConstraintsWithSuperView:(UIView *)superview subview:(UIView *)subview {
    [D20LayoutHelper widthHeightEquivalentsConstraintsWithSuperView:superview subview:subview constants:zeroConstants];
}

+ (void)widthHeightEquivalentsConstraintsWithSuperView:(UIView *)superview subview:(UIView *)subview constants:(float *)constants {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    [[subview.topAnchor constraintEqualToAnchor:superview.topAnchor constant:constants[0]] setActive:YES];
    [[subview.rightAnchor constraintEqualToAnchor:superview.rightAnchor constant:constants[1]] setActive:YES];
    [[subview.bottomAnchor constraintEqualToAnchor:superview.bottomAnchor constant:constants[2]] setActive:YES];
    [[subview.leftAnchor constraintEqualToAnchor:superview.leftAnchor constant:constants[3]] setActive:YES];
}

+ (void)widthHeightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview subview:(UIView *)subview {
    [D20LayoutHelper widthHeightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:superview subview:subview constants:zeroConstants];
}

+ (void)widthHeightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview subview:(UIView *)subview constants:(float *)constants {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    [[subview.topAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.topAnchor constant:constants[0]] setActive:YES];
    [[subview.rightAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.rightAnchor constant:constants[1]] setActive:YES];
    [[subview.bottomAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.bottomAnchor constant:constants[2]] setActive:YES];
    [[subview.leftAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.leftAnchor constant:constants[3]] setActive:YES];
}
    
+ (void)widthEquivalentsConstraintsWithSuperView:(UIView *)superview subview:(UIView *)subview {
    [D20LayoutHelper widthEquivalentsConstraintsWithSuperView:superview subview:subview constants:zeroConstants];
}

+ (void)widthEquivalentsConstraintsWithSuperView:(UIView *)superview subview:(UIView *)subview constants:(float *)constants {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    [[subview.leadingAnchor constraintEqualToAnchor:superview.leadingAnchor constant:constants[0]] setActive:YES];
    [[subview.trailingAnchor constraintEqualToAnchor:superview.trailingAnchor constant:constants[1]] setActive:YES];
}
    
+ (void)widthEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview subview:(UIView *)subview {
    [D20LayoutHelper widthEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:superview subview:subview constants:zeroConstants];
}

+ (void)widthEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview subview:(UIView *)subview constants:(float *)constants {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    [[subview.leadingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.leadingAnchor constant:constants[0]] setActive:YES];
    [[subview.trailingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.trailingAnchor constant:constants[1]] setActive:YES];
}
    
+ (void)heightEquivalentsConstraintsWithSuperView:(UIView *)superview subview:(UIView *)subview {
    [D20LayoutHelper heightEquivalentsConstraintsWithSuperView:superview subview:subview constants:zeroConstants];
}

+ (void)heightEquivalentsConstraintsWithSuperView:(UIView *)superview subview:(UIView *)subview constants:(float *)constants {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    [[subview.topAnchor constraintEqualToAnchor:superview.topAnchor constant:constants[0]] setActive:YES];
    [[subview.bottomAnchor constraintEqualToAnchor:superview.bottomAnchor constant:constants[1]] setActive:YES];
}
    
+ (void)heightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview subview:(UIView *)subview {
    [D20LayoutHelper heightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:superview subview:subview constants:zeroConstants];
}

+ (void)heightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview subview:(UIView *)subview constants:(float *)constants {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    [[subview.topAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.topAnchor constant:constants[0]] setActive:YES];
    [[subview.bottomAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.bottomAnchor constant:constants[1]] setActive:YES];
}

+ (UIStackView *)evenConstraintsWithSuperView:(UIView *)superview
                                    subviews:(NSArray<UIView *> *)subviews
                                   alignment:(UIStackViewAlignment)alignment
                                distribution:(UIStackViewDistribution)distribution
                                axis:(UILayoutConstraintAxis)axis
                             spacing:(CGFloat)spacing {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:subviews];
    UIStackView *stackView = [D20LayoutHelper stackviewWithSubviews:subviews alignment:alignment distribution:distribution axis:axis spacing:spacing];
    [D20LayoutHelper widthHeightEquivalentsConstraintsWithSuperView:superview subview:stackView];
    return stackView;
}

+ (UIStackView *)evenConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview
                                                        subviews:(NSArray<UIView *> *)subviews
                                                       alignment:(UIStackViewAlignment)alignment
                                                    distribution:(UIStackViewDistribution)distribution
                                                    axis:(UILayoutConstraintAxis)axis
                                                 spacing:(CGFloat)spacing {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:subviews];
    UIStackView *stackView = [D20LayoutHelper stackviewWithSubviews:subviews alignment:alignment distribution:distribution axis:axis spacing:spacing];
    [D20LayoutHelper widthHeightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:superview subview:stackView];
    return stackView;
}
    
+ (NSArray<NSLayoutConstraint *> *)pinItemToTopWithSuperView:(UIView *)superview subview:(UIView *)subview height:(CGFloat)height {
    return [D20LayoutHelper pinItemToTopWithSuperView:superview subview:subview height:height constants:zeroConstants];
}

+ (NSArray<NSLayoutConstraint *> *)pinItemToTopWithSuperView:(UIView *)superview subview:(UIView *)subview height:(CGFloat)height constants:(float *)constants {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    [[subview.leadingAnchor constraintEqualToAnchor:superview.leadingAnchor constant:constants[0]] setActive:YES];
    [[subview.topAnchor constraintEqualToAnchor:superview.topAnchor constant:constants[1]] setActive:YES];
    [[subview.trailingAnchor constraintEqualToAnchor:superview.trailingAnchor constant:constants[2]] setActive:YES];
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@", [NSNumber numberWithUnsignedInteger:subview.hash].stringValue];
    NSDictionary *viewsDictionary = @{hashedViewString : subview};
    NSArray<NSLayoutConstraint *> *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:
                                                          [NSString stringWithFormat:@"V:[%@(==%f)]", hashedViewString, height]
                                                                                                 options:0
                                                                                                 metrics:nil
                                                                                                   views:viewsDictionary];
    [NSLayoutConstraint activateConstraints:verticalConstraints];
    return verticalConstraints;
}
    
+ (NSArray<NSLayoutConstraint *> *)pinItemToTopByTopLayoutMarginsGuideWithSuperView:(UIView *)superview subview:(UIView *)subview height:(CGFloat)height {
    return [D20LayoutHelper pinItemToTopByTopLayoutMarginsGuideWithSuperView:superview subview:subview height:height constants:zeroConstants];
}

+ (NSArray<NSLayoutConstraint *> *)pinItemToTopByTopLayoutMarginsGuideWithSuperView:(UIView *)superview subview:(UIView *)subview height:(CGFloat)height constants:(float *)constants {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    [[subview.leadingAnchor constraintEqualToAnchor:superview.leadingAnchor constant:constants[0]] setActive:YES];
    [[subview.topAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.topAnchor constant:constants[1]] setActive:YES];
    [[subview.trailingAnchor constraintEqualToAnchor:superview.trailingAnchor constant:constants[2]] setActive:YES];
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@", [NSNumber numberWithUnsignedInteger:subview.hash].stringValue];
    NSDictionary *viewsDictionary = @{hashedViewString : subview};
    NSArray<NSLayoutConstraint *> *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:
                                                          [NSString stringWithFormat:@"V:[%@(==%f)]", hashedViewString, height]
                                                                                                 options:0
                                                                                                 metrics:nil
                                                                                                   views:viewsDictionary];
    [NSLayoutConstraint activateConstraints:verticalConstraints];
    return verticalConstraints;
}

+ (NSArray<NSLayoutConstraint *> *)pinItemToTopByLayoutMarginsGuideWithSuperView:(UIView *)superview subview:(UIView *)subview height:(CGFloat)height {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    [[subview.leadingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.leadingAnchor] setActive:YES];
    [[subview.topAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.topAnchor] setActive:YES];
    [[subview.trailingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.trailingAnchor] setActive:YES];
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@", [NSNumber numberWithUnsignedInteger:subview.hash].stringValue];
    NSDictionary *viewsDictionary = @{hashedViewString : subview};
    NSArray<NSLayoutConstraint *> *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:
                                                          [NSString stringWithFormat:@"V:[%@(==%f)]", hashedViewString, height]
                                                                                                 options:0
                                                                                                 metrics:nil
                                                                                                   views:viewsDictionary];
    [NSLayoutConstraint activateConstraints:verticalConstraints];
    return [D20LayoutHelper pinItemToTopByLayoutMarginsGuideWithSuperView:superview subview:subview height:height constants:zeroConstants];
}

+ (NSArray<NSLayoutConstraint *> *)pinItemToTopByLayoutMarginsGuideWithSuperView:(UIView *)superview subview:(UIView *)subview height:(CGFloat)height constants:(float *)constants {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    [[subview.leadingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.leadingAnchor constant:constants[0]] setActive:YES];
    [[subview.topAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.topAnchor constant:constants[1]] setActive:YES];
    [[subview.trailingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.trailingAnchor constant:constants[2]] setActive:YES];
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@", [NSNumber numberWithUnsignedInteger:subview.hash].stringValue];
    NSDictionary *viewsDictionary = @{hashedViewString : subview};
    NSArray<NSLayoutConstraint *> *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:
                                                          [NSString stringWithFormat:@"V:[%@(==%f)]", hashedViewString, height]
                                                                                                 options:0
                                                                                                 metrics:nil
                                                                                                   views:viewsDictionary];
    [NSLayoutConstraint activateConstraints:verticalConstraints];
    return verticalConstraints;
}
    
+ (NSArray<NSLayoutConstraint *> *)centeredItemsWithSuperView:(UIView *)superview
                          subviews:(NSArray<UIView *> *)subviews
                         alignment:(UIStackViewAlignment)alignment
                      distribution:(UIStackViewDistribution)distribution
                              axis:(UILayoutConstraintAxis)axis
                           spacing:(CGFloat)spacing {
    UIStackView *stackView = [D20LayoutHelper stackviewWithSubviews:subviews alignment:alignment distribution:distribution axis:axis spacing:spacing];
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
    UIStackView *stackView = [D20LayoutHelper stackviewWithSubviews:subviews alignment:alignment distribution:distribution axis:axis spacing:spacing];
    [D20LayoutHelper widthEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:superview subview:stackView];
    NSArray<NSLayoutConstraint *> *constraints = [D20LayoutHelper pinItemtoCenterOfSuperView:superview subview:stackView];
    return constraints;
}
    
+ (NSArray<NSLayoutConstraint *> *)pinItemtoCenterOfSuperView:(UIView *)superview subview:(UIView *)subview {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
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
    NSArray<NSLayoutConstraint *> *constraints = @[constraintX, constraintY];
    [NSLayoutConstraint activateConstraints:constraints];
    return constraints;
}

+ (NSArray<NSLayoutConstraint *> *)pinItemtoCenterOfSuperView:(UIView *)superview subview:(UIView *)subview width:(CGFloat)width height:(CGFloat)height {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    NSArray<NSLayoutConstraint *> *constraints = [D20LayoutHelper constraintsForWidthAndHeightOnSuperView:superview subview:subview width:width height:height];
    constraints = [constraints arrayByAddingObjectsFromArray:[D20LayoutHelper pinItemtoCenterOfSuperView:superview subview:subview]];
    return constraints;
}
    
+ (NSArray<NSLayoutConstraint *> *)pinItemToBottomWithSuperView:(UIView *)superview subview:(UIView *)subview height:(CGFloat)height {
    return [D20LayoutHelper pinItemToBottomWithSuperView:superview subview:subview height:height constants:zeroConstants];
}

+ (NSArray<NSLayoutConstraint *> *)pinItemToBottomWithSuperView:(UIView *)superview subview:(UIView *)subview height:(CGFloat)height constants:(float *)constants {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    [[subview.leadingAnchor constraintEqualToAnchor:superview.leadingAnchor constant:constants[0]] setActive:YES];
    [[subview.bottomAnchor constraintEqualToAnchor:superview.bottomAnchor constant:constants[1]] setActive:YES];
    [[subview.trailingAnchor constraintEqualToAnchor:superview.trailingAnchor constant:constants[2]] setActive:YES];
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@", [NSNumber numberWithUnsignedInteger:subview.hash].stringValue];
    NSDictionary *viewsDictionary = @{hashedViewString : subview};
    NSArray<NSLayoutConstraint *> *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:
                                                          [NSString stringWithFormat:@"V:[%@(==%f)]", hashedViewString, height]
                                                                                                 options:0
                                                                                                 metrics:nil
                                                                                                   views:viewsDictionary];
    [NSLayoutConstraint activateConstraints:verticalConstraints];
    return verticalConstraints;
}

+ (NSArray<NSLayoutConstraint *> *)pinItemToBottomByBottomLayoutMarginsGuideWithSuperView:(UIView *)superview subview:(UIView *)subview height:(CGFloat)height {
    return [D20LayoutHelper pinItemToBottomByBottomLayoutMarginsGuideWithSuperView:superview subview:subview height:height constants:zeroConstants];
}

+ (NSArray<NSLayoutConstraint *> *)pinItemToBottomByBottomLayoutMarginsGuideWithSuperView:(UIView *)superview subview:(UIView *)subview height:(CGFloat)height constants:(float *)constants {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    [[subview.leadingAnchor constraintEqualToAnchor:superview.leadingAnchor constant:constants[0]] setActive:YES];
    [[subview.bottomAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.bottomAnchor constant:constants[1]] setActive:YES];
    [[subview.trailingAnchor constraintEqualToAnchor:superview.trailingAnchor constant:constants[2]] setActive:YES];
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@", [NSNumber numberWithUnsignedInteger:subview.hash].stringValue];
    NSDictionary *viewsDictionary = @{hashedViewString : subview};
    NSArray<NSLayoutConstraint *> *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:
                                                          [NSString stringWithFormat:@"V:[%@(==%f)]", hashedViewString, height]
                                                                                                 options:0
                                                                                                 metrics:nil
                                                                                                   views:viewsDictionary];
    [NSLayoutConstraint activateConstraints:verticalConstraints];
    return verticalConstraints;
}
    
+ (NSArray<NSLayoutConstraint *> *)pinItemToBottomByLayoutMarginsGuideWithSuperView:(UIView *)superview subview:(UIView *)subview height:(CGFloat)height {
    return [D20LayoutHelper pinItemToBottomByLayoutMarginsGuideWithSuperView:superview subview:subview height:height constants:zeroConstants];
}

+ (NSArray<NSLayoutConstraint *> *)pinItemToBottomByLayoutMarginsGuideWithSuperView:(UIView *)superview subview:(UIView *)subview height:(CGFloat)height constants:(float *)constants {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    [[subview.leadingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.leadingAnchor constant:constants[0]] setActive:YES];
    [[subview.bottomAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.bottomAnchor constant:constants[1]] setActive:YES];
    [[subview.trailingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.trailingAnchor constant:constants[2]] setActive:YES];
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@", [NSNumber numberWithUnsignedInteger:subview.hash].stringValue];
    NSDictionary *viewsDictionary = @{hashedViewString : subview};
    NSArray<NSLayoutConstraint *> *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:
                                                          [NSString stringWithFormat:@"V:[%@(==%f)]", hashedViewString, height]
                                                                                                 options:0
                                                                                                 metrics:nil
                                                                                                   views:viewsDictionary];
    [NSLayoutConstraint activateConstraints:verticalConstraints];
    return verticalConstraints;
}
    
+ (NSArray<NSLayoutConstraint *> *)constraintsForWidthAndHeightOnSuperView:(UIView *)superview subview:(UIView *)subview width:(CGFloat)width height:(CGFloat)height {
    [D20LayoutHelper prepViewsWithSuperview:superview subviews:@[subview]];
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@", [NSNumber numberWithUnsignedInteger:subview.hash].stringValue];
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
