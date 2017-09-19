//
//  UIView+LayoutHelper.m
//  D2LayoutHelperPod
//
//  Created by Brian Sharrief Alim Bowman on 9/18/17.
//

#import "UIView+LayoutHelper.h"

@implementation UIView (LayoutHelper)

static float zeroConstants[] = { 0.0f, 0.0f, 0.0f, 0.0f };

- (void)setWidthConstant:(NSInteger)constant {
    [[self.widthAnchor constraintEqualToConstant:constant] setActive:YES];
}

- (void)setHeightConstant:(NSInteger)constant {
    [[self.heightAnchor constraintEqualToConstant:constant] setActive:YES];
}

- (void)setHeightConstant:(NSInteger)heightConstant widthConstant:(NSInteger)widthConstant {
    [self setHeightConstant:heightConstant];
    [self setWidthConstant:widthConstant];
}

- (NSArray<NSLayoutConstraint *> *)centerVertically:(UIView *)superview {
    [self prepViewsWithSuperview:superview];
    NSLayoutConstraint *constraintY = [NSLayoutConstraint constraintWithItem:self
                                                                   attribute:NSLayoutAttributeCenterY
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:superview
                                                                   attribute:NSLayoutAttributeCenterY
                                                                  multiplier:1
                                                                    constant:0];
    NSArray<NSLayoutConstraint *> *constraints = @[constraintY];
    [NSLayoutConstraint activateConstraints:constraints];
    return constraints;
}

- (NSArray<NSLayoutConstraint *> *)centerHorizontally:(UIView *)superview {
    [self prepViewsWithSuperview:superview];
    NSLayoutConstraint *constraintX = [NSLayoutConstraint constraintWithItem:self
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:superview
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1
                                                                    constant:0];
    NSArray<NSLayoutConstraint *> *constraints = @[constraintX];
    [NSLayoutConstraint activateConstraints:constraints];
    return constraints;
}

- (void)centerItemBelowItem:(UIView *)topview superview:(UIView*)superview width:(CGFloat)width height:(CGFloat)height {
    [self centerItemBelowItem:topview superview:superview width:width height:height constant:0];
}

- (void)centerItemBelowItem:(UIView *)topview superview:(UIView*)superview width:(CGFloat)width height:(CGFloat)height constant:(CGFloat)constant {
    [self prepViewsWithSuperview:superview];
    [[self.topAnchor constraintEqualToAnchor:topview.bottomAnchor constant:constant] setActive:YES];
    [self setHeightConstant:(long)height widthConstant:(long)width];
    [self centerHorizontally:superview];
}

- (void)centerItemWithLayoutMarginsGuideBelowItem:(UIView *)topview superview:(UIView*)superview width:(CGFloat)width height:(CGFloat)height constant:(CGFloat)constant {
    [self prepViewsWithSuperview:superview];
    [[self.layoutMarginsGuide.topAnchor constraintEqualToAnchor:topview.layoutMarginsGuide.bottomAnchor constant:constant] setActive:YES];
    [self setHeightConstant:(long)height widthConstant:(long)width];
    [self centerHorizontally:superview];
}

- (void)centerItemWithLayoutMarginsGuideBelowItem:(UIView *)topview superview:(UIView*)superview width:(CGFloat)width height:(CGFloat)height {
    [self centerItemBelowItem:topview superview:superview width:width height:height constant:0];
}

- (void)centerItemAboveItem:(UIView *)bottomview superview:(UIView*)superview width:(CGFloat)width height:(CGFloat)height {
    [self centerItemAboveItem:bottomview superview:superview width:width height:height constant:0];
}

- (void)centerItemAboveItem:(UIView *)bottomview superview:(UIView*)superview width:(CGFloat)width height:(CGFloat)height constant:(CGFloat)constant {
    [self prepViewsWithSuperview:superview];
    [[self.bottomAnchor constraintEqualToAnchor:bottomview.topAnchor constant:constant] setActive:YES];
    [self setHeightConstant:(long)height widthConstant:(long)width];
    [self centerHorizontally:superview];
}

- (void)centerItemWithLayoutMarginsGuideAboveItem:(UIView *)bottomview superview:(UIView*)superview width:(CGFloat)width height:(CGFloat)height constant:(CGFloat)constant {
    [self prepViewsWithSuperview:superview];
    [[self.layoutMarginsGuide.bottomAnchor constraintEqualToAnchor:bottomview.layoutMarginsGuide.topAnchor constant:constant] setActive:YES];
    [self setHeightConstant:(long)height widthConstant:(long)width];
    [self centerHorizontally:superview];
}

- (void)stackViewAboveView:(UIView *)bottomView superview:(UIView *)superview height:(CGFloat)height constant:(CGFloat)constant {
    [self prepViewsWithSuperview:superview];
    [self setHeightConstant:(long)height];
    [[self.leadingAnchor constraintEqualToAnchor:bottomView.leadingAnchor] setActive:YES];
    [[self.trailingAnchor constraintEqualToAnchor:bottomView.trailingAnchor] setActive:YES];
    [[self.bottomAnchor constraintEqualToAnchor:bottomView.topAnchor constant:constant] setActive:YES];
}

- (void)stackViewAboveView:(UIView *)bottomView superview:(UIView *)superview height:(CGFloat)height {
    [self stackViewAboveView:bottomView superview:superview height:height constant:0];
}

- (void)stackViewBelowView:(UIView *)topView superview:(UIView *)superview height:(CGFloat)height constant:(CGFloat)constant {
    [self prepViewsWithSuperview:superview];
    [self setHeightConstant:(long)height];
    [[self.leadingAnchor constraintEqualToAnchor:topView.leadingAnchor] setActive:YES];
    [[self.trailingAnchor constraintEqualToAnchor:topView.trailingAnchor] setActive:YES];
    [[self.topAnchor constraintEqualToAnchor:topView.bottomAnchor constant:constant] setActive:YES];
}

- (void)stackViewBelowView:(UIView *)topView superview:(UIView *)superview height:(CGFloat)height {
    [self stackViewBelowView:topView superview:superview height:height constant:0];
}

- (void)fillViewBelowView:(UIView *)topView superview:(UIView *)superview padding:(CGFloat)padding {
    [self prepViewsWithSuperview:superview];
    [[self.leadingAnchor constraintEqualToAnchor:topView.leadingAnchor] setActive:YES];
    [[self.trailingAnchor constraintEqualToAnchor:topView.trailingAnchor] setActive:YES];
    [[self.topAnchor constraintEqualToAnchor:topView.bottomAnchor constant:padding] setActive:YES];
    [[self.bottomAnchor constraintEqualToAnchor:superview.bottomAnchor] setActive:YES];
}

- (void)fillViewBetween:(UIView *)topView bottomView:(UIView *)bottomView superview:(UIView *)superview topPadding:(CGFloat)topPadding bottomPadding:(CGFloat)bottomPadding {
    [self prepViewsWithSuperview:superview];
    [[self.leadingAnchor constraintEqualToAnchor:topView.leadingAnchor] setActive:YES];
    [[self.trailingAnchor constraintEqualToAnchor:topView.trailingAnchor] setActive:YES];
    [[self.topAnchor constraintEqualToAnchor:topView.bottomAnchor constant:bottomPadding] setActive:YES];
    [[self.bottomAnchor constraintEqualToAnchor:bottomView.topAnchor constant:topPadding] setActive:YES];
}

- (void)centerAndSquareItemToFillSuperview:(UIView *)superview {
    [self prepViewsWithSuperview:superview];
    [self pinItemtoCenterOfSuperView:superview];
    [self heightEquivalentsConstraintsWithSuperView:superview];
    [[self.widthAnchor constraintEqualToAnchor:superview.widthAnchor multiplier:0.5] setActive:YES];
}

/**********************************************************************
 **********************************************************************/

- (void)widthHeightEquivalentsConstraintsWithSuperView:(UIView *)superview {
    [self widthHeightEquivalentsConstraintsWithSuperView:superview constants:zeroConstants];
}

- (void)widthHeightEquivalentsConstraintsWithSuperView:(UIView *)superview constants:(float *)constants {
    [self prepViewsWithSuperview:superview];
    [[self.topAnchor constraintEqualToAnchor:superview.topAnchor constant:constants[0]] setActive:YES];
    [[self.rightAnchor constraintEqualToAnchor:superview.rightAnchor constant:constants[1]] setActive:YES];
    [[self.bottomAnchor constraintEqualToAnchor:superview.bottomAnchor constant:constants[2]] setActive:YES];
    [[self.leftAnchor constraintEqualToAnchor:superview.leftAnchor constant:constants[3]] setActive:YES];
}

- (void)widthHeightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview {
    [self widthHeightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:superview constants:zeroConstants];
}

- (void)widthHeightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview constants:(float *)constants {
    [self prepViewsWithSuperview:superview];
    [[self.topAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.topAnchor constant:constants[0]] setActive:YES];
    [[self.rightAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.rightAnchor constant:constants[1]] setActive:YES];
    [[self.bottomAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.bottomAnchor constant:constants[2]] setActive:YES];
    [[self.leftAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.leftAnchor constant:constants[3]] setActive:YES];
}

- (void)widthEquivalentsConstraintsWithSuperView:(UIView *)superview {
    [self widthEquivalentsConstraintsWithSuperView:superview constants:zeroConstants];
}

- (void)widthEquivalentsConstraintsWithSuperView:(UIView *)superview constants:(float *)constants {
    [self prepViewsWithSuperview:superview];
    [[self.leadingAnchor constraintEqualToAnchor:superview.leadingAnchor constant:constants[0]] setActive:YES];
    [[self.trailingAnchor constraintEqualToAnchor:superview.trailingAnchor constant:constants[1]] setActive:YES];
}

- (void)widthEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview {
    [self widthEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:superview constants:zeroConstants];
}

- (void)widthEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview constants:(float *)constants {
    [self prepViewsWithSuperview:superview];
    [[self.leadingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.leadingAnchor constant:constants[0]] setActive:YES];
    [[self.trailingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.trailingAnchor constant:constants[1]] setActive:YES];
}

- (void)heightEquivalentsConstraintsWithSuperView:(UIView *)superview {
    [self heightEquivalentsConstraintsWithSuperView:superview constants:zeroConstants];
}

- (void)heightEquivalentsConstraintsWithSuperView:(UIView *)superview constants:(float *)constants {
    [self prepViewsWithSuperview:superview];
    [[self.topAnchor constraintEqualToAnchor:superview.topAnchor constant:constants[0]] setActive:YES];
    [[self.bottomAnchor constraintEqualToAnchor:superview.bottomAnchor constant:constants[1]] setActive:YES];
}

- (void)heightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview {
    [self heightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:superview constants:zeroConstants];
}

- (void)heightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview constants:(float *)constants {
    [self prepViewsWithSuperview:superview];
    [[self.topAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.topAnchor constant:constants[0]] setActive:YES];
    [[self.bottomAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.bottomAnchor constant:constants[1]] setActive:YES];
}

+ (UIStackView *)evenConstraintsWithSuperView:(UIView *)superview
                                     subviews:(NSArray<UIView *> *)subviews
                                    alignment:(UIStackViewAlignment)alignment
                                 distribution:(UIStackViewDistribution)distribution
                                         axis:(UILayoutConstraintAxis)axis
                                      spacing:(CGFloat)spacing {
    [UIView prepViewsWithSuperview:superview subviews:subviews];
    UIStackView *stackView = [UIView stackviewWithsubviews:subviews alignment:alignment distribution:distribution axis:axis spacing:spacing];
    [stackView widthHeightEquivalentsConstraintsWithSuperView:superview];
    return stackView;
}

+ (UIStackView *)evenConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview
                                                         subviews:(NSArray<UIView *> *)subviews
                                                        alignment:(UIStackViewAlignment)alignment
                                                     distribution:(UIStackViewDistribution)distribution
                                                             axis:(UILayoutConstraintAxis)axis
                                                          spacing:(CGFloat)spacing {
    [UIView prepViewsWithSuperview:superview subviews:subviews];
    UIStackView *stackView = [UIView stackviewWithsubviews:subviews alignment:alignment distribution:distribution axis:axis spacing:spacing];
    [stackView widthHeightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:superview];
    return stackView;
}

- (NSArray<NSLayoutConstraint *> *)pinItemToTopWithSuperView:(UIView *)superview height:(CGFloat)height {
    return [self pinItemToTopWithSuperView:superview height:height constants:zeroConstants];
}

- (NSArray<NSLayoutConstraint *> *)pinItemToTopWithSuperView:(UIView *)superview height:(CGFloat)height constants:(float *)constants {
    [self prepViewsWithSuperview:superview];
    [[self.leadingAnchor constraintEqualToAnchor:superview.leadingAnchor constant:constants[0]] setActive:YES];
    [[self.topAnchor constraintEqualToAnchor:superview.topAnchor constant:constants[1]] setActive:YES];
    [[self.trailingAnchor constraintEqualToAnchor:superview.trailingAnchor constant:constants[2]] setActive:YES];
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@", [NSNumber numberWithUnsignedInteger:self.hash].stringValue];
    NSDictionary *viewsDictionary = @{hashedViewString : self};
    NSArray<NSLayoutConstraint *> *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:
                                                          [NSString stringWithFormat:@"V:[%@(==%f)]", hashedViewString, height]
                                                                                                 options:0
                                                                                                 metrics:nil
                                                                                                   views:viewsDictionary];
    [NSLayoutConstraint activateConstraints:verticalConstraints];
    return verticalConstraints;
}

- (NSArray<NSLayoutConstraint *> *)pinItemToTopByTopLayoutMarginsGuideWithSuperView:(UIView *)superview height:(CGFloat)height {
    return [self pinItemToTopByTopLayoutMarginsGuideWithSuperView:superview height:height constants:zeroConstants];
}

- (NSArray<NSLayoutConstraint *> *)pinItemToTopByTopLayoutMarginsGuideWithSuperView:(UIView *)superview height:(CGFloat)height constants:(float *)constants {
    [self prepViewsWithSuperview:superview];
    [[self.leadingAnchor constraintEqualToAnchor:superview.leadingAnchor constant:constants[0]] setActive:YES];
    [[self.topAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.topAnchor constant:constants[1]] setActive:YES];
    [[self.trailingAnchor constraintEqualToAnchor:superview.trailingAnchor constant:constants[2]] setActive:YES];
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@", [NSNumber numberWithUnsignedInteger:self.hash].stringValue];
    NSDictionary *viewsDictionary = @{hashedViewString : self};
    NSArray<NSLayoutConstraint *> *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:
                                                          [NSString stringWithFormat:@"V:[%@(==%f)]", hashedViewString, height]
                                                                                                 options:0
                                                                                                 metrics:nil
                                                                                                   views:viewsDictionary];
    [NSLayoutConstraint activateConstraints:verticalConstraints];
    return verticalConstraints;
}

- (NSArray<NSLayoutConstraint *> *)pinItemToTopByLayoutMarginsGuideWithSuperView:(UIView *)superview height:(CGFloat)height {
    [self prepViewsWithSuperview:superview];
    [[self.leadingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.leadingAnchor] setActive:YES];
    [[self.topAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.topAnchor] setActive:YES];
    [[self.trailingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.trailingAnchor] setActive:YES];
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@", [NSNumber numberWithUnsignedInteger:self.hash].stringValue];
    NSDictionary *viewsDictionary = @{hashedViewString : self};
    NSArray<NSLayoutConstraint *> *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:
                                                          [NSString stringWithFormat:@"V:[%@(==%f)]", hashedViewString, height]
                                                                                                 options:0
                                                                                                 metrics:nil
                                                                                                   views:viewsDictionary];
    [NSLayoutConstraint activateConstraints:verticalConstraints];
    return [self pinItemToTopByLayoutMarginsGuideWithSuperView:superview height:height constants:zeroConstants];
}

- (NSArray<NSLayoutConstraint *> *)pinItemToTopByLayoutMarginsGuideWithSuperView:(UIView *)superview height:(CGFloat)height constants:(float *)constants {
    [self prepViewsWithSuperview:superview];
    [[self.leadingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.leadingAnchor constant:constants[0]] setActive:YES];
    [[self.topAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.topAnchor constant:constants[1]] setActive:YES];
    [[self.trailingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.trailingAnchor constant:constants[2]] setActive:YES];
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@", [NSNumber numberWithUnsignedInteger:self.hash].stringValue];
    NSDictionary *viewsDictionary = @{hashedViewString : self};
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
    UIStackView *stackView = [UIView stackviewWithsubviews:subviews alignment:alignment distribution:distribution axis:axis spacing:spacing];
    [stackView widthEquivalentsConstraintsWithSuperView:superview];
    NSArray<NSLayoutConstraint *> *constraints = [stackView pinItemtoCenterOfSuperView:superview];
    return constraints;
}

+ (NSArray<NSLayoutConstraint *> *)centeredItemsByLayoutMarginsGuideWithSuperView:(UIView *)superview
                                                                         subviews:(NSArray<UIView *> *)subviews
                                                                        alignment:(UIStackViewAlignment)alignment
                                                                     distribution:(UIStackViewDistribution)distribution
                                                                             axis:(UILayoutConstraintAxis)axis
                                                                          spacing:(CGFloat)spacing {
    UIStackView *stackView = [UIView stackviewWithsubviews:subviews alignment:alignment distribution:distribution axis:axis spacing:spacing];
    [stackView widthEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:superview];
    NSArray<NSLayoutConstraint *> *constraints = [stackView pinItemtoCenterOfSuperView:superview];
    return constraints;
}

- (NSArray<NSLayoutConstraint *> *)pinItemtoCenterOfSuperView:(UIView *)superview {
    [self prepViewsWithSuperview:superview];
    NSLayoutConstraint *constraintX = [NSLayoutConstraint constraintWithItem:self
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:superview
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1
                                                                    constant:1];
    NSLayoutConstraint *constraintY = [NSLayoutConstraint constraintWithItem:self
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

- (NSArray<NSLayoutConstraint *> *)pinItemtoCenterOfSuperView:(UIView *)superview width:(CGFloat)width height:(CGFloat)height {
    [self prepViewsWithSuperview:superview];
    NSArray<NSLayoutConstraint *> *constraints = [self constraintsForWidthAndHeightOnSuperView:superview width:width height:height];
    constraints = [constraints arrayByAddingObjectsFromArray:[self pinItemtoCenterOfSuperView:superview]];
    return constraints;
}

- (NSArray<NSLayoutConstraint *> *)pinItemToBottomWithSuperView:(UIView *)superview height:(CGFloat)height {
    return [self pinItemToBottomWithSuperView:superview height:height constants:zeroConstants];
}

- (NSArray<NSLayoutConstraint *> *)pinItemToBottomWithSuperView:(UIView *)superview height:(CGFloat)height constants:(float *)constants {
    [self prepViewsWithSuperview:superview];
    [[self.leadingAnchor constraintEqualToAnchor:superview.leadingAnchor constant:constants[0]] setActive:YES];
    [[self.bottomAnchor constraintEqualToAnchor:superview.bottomAnchor constant:constants[1]] setActive:YES];
    [[self.trailingAnchor constraintEqualToAnchor:superview.trailingAnchor constant:constants[2]] setActive:YES];
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@", [NSNumber numberWithUnsignedInteger:self.hash].stringValue];
    NSDictionary *viewsDictionary = @{hashedViewString : self};
    NSArray<NSLayoutConstraint *> *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:
                                                          [NSString stringWithFormat:@"V:[%@(==%f)]", hashedViewString, height]
                                                                                                 options:0
                                                                                                 metrics:nil
                                                                                                   views:viewsDictionary];
    [NSLayoutConstraint activateConstraints:verticalConstraints];
    return verticalConstraints;
}

- (NSArray<NSLayoutConstraint *> *)pinItemToBottomByBottomLayoutMarginsGuideWithSuperView:(UIView *)superview height:(CGFloat)height {
    return [self pinItemToBottomByBottomLayoutMarginsGuideWithSuperView:superview height:height constants:zeroConstants];
}

- (NSArray<NSLayoutConstraint *> *)pinItemToBottomByBottomLayoutMarginsGuideWithSuperView:(UIView *)superview height:(CGFloat)height constants:(float *)constants {
    [self prepViewsWithSuperview:superview];
    [[self.leadingAnchor constraintEqualToAnchor:superview.leadingAnchor constant:constants[0]] setActive:YES];
    [[self.bottomAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.bottomAnchor constant:constants[1]] setActive:YES];
    [[self.trailingAnchor constraintEqualToAnchor:superview.trailingAnchor constant:constants[2]] setActive:YES];
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@", [NSNumber numberWithUnsignedInteger:self.hash].stringValue];
    NSDictionary *viewsDictionary = @{hashedViewString : self};
    NSArray<NSLayoutConstraint *> *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:
                                                          [NSString stringWithFormat:@"V:[%@(==%f)]", hashedViewString, height]
                                                                                                 options:0
                                                                                                 metrics:nil
                                                                                                   views:viewsDictionary];
    [NSLayoutConstraint activateConstraints:verticalConstraints];
    return verticalConstraints;
}

- (NSArray<NSLayoutConstraint *> *)pinItemToBottomByLayoutMarginsGuideWithSuperView:(UIView *)superview height:(CGFloat)height {
    return [self pinItemToBottomByLayoutMarginsGuideWithSuperView:superview height:height constants:zeroConstants];
}

- (NSArray<NSLayoutConstraint *> *)pinItemToBottomByLayoutMarginsGuideWithSuperView:(UIView *)superview height:(CGFloat)height constants:(float *)constants {
    [self prepViewsWithSuperview:superview];
    [[self.leadingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.leadingAnchor constant:constants[0]] setActive:YES];
    [[self.bottomAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.bottomAnchor constant:constants[1]] setActive:YES];
    [[self.trailingAnchor constraintEqualToAnchor:superview.layoutMarginsGuide.trailingAnchor constant:constants[2]] setActive:YES];
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@", [NSNumber numberWithUnsignedInteger:self.hash].stringValue];
    NSDictionary *viewsDictionary = @{hashedViewString : self};
    NSArray<NSLayoutConstraint *> *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:
                                                          [NSString stringWithFormat:@"V:[%@(==%f)]", hashedViewString, height]
                                                                                                 options:0
                                                                                                 metrics:nil
                                                                                                   views:viewsDictionary];
    [NSLayoutConstraint activateConstraints:verticalConstraints];
    return verticalConstraints;
}

- (NSArray<NSLayoutConstraint *> *)constraintsForWidthAndHeightOnSuperView:(UIView *)superview width:(CGFloat)width height:(CGFloat)height {
    [self prepViewsWithSuperview:superview];
    NSString *hashedViewString = [NSString stringWithFormat:@"_%@", [NSNumber numberWithUnsignedInteger:self.hash].stringValue];
    NSDictionary *viewsDictionary = @{hashedViewString : self};
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
 this function translatesAutoresizingMaskIntoConstraints to NO and adds the subviews to the superview
 @param superview the superview
 */
- (void)prepViewsWithSuperview:(UIView *)superview {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    if ([superview.subviews containsObject:self]) return;
    [superview addSubview:self];
}

/*!
 this function returns a stackview for use with the even distribution functions
 */
+ (UIStackView *)stackviewWithsubviews:(NSArray<UIView *> *)subviews
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

- (UILayoutGuide *)layoutMarginsGuide {
    if (@available(iOS 11.0, *)) {
        return self.safeAreaLayoutGuide;
    } else {
        return self.layoutMarginsGuide;
    }
}

@end

