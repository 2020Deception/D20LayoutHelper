//
//  D2LayoutHelper.h
//  Pods
//
//  Created by Brian Bowman on 9/6/16.
//
//

@import Foundation;
@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface D20LayoutHelper : NSObject

/*!
 pins the subview to the top, left and right edges of the superview, similar to the placement of a navigation bar.
 @param superview the superview
 @param subview the subview
 @param height the height of the subview
 @returns the layout constraints
 */
+ (NSArray<NSLayoutConstraint *> *)pinItemToTopWithSuperView:(UIView *)superview
                                                     subview:(UIView *)subview
                                                      height:(CGFloat)height;

/*!
 pins the subview to the top with its LayoutMarginsGuide, left and right edges of the superview.
 @param superview the superview
 @param subview the subview
 @param height the height of the subview
 @returns the layout constraints
 */
+ (NSArray<NSLayoutConstraint *> *)pinItemToTopWithTopLayoutMarginsGuideWithSuperView:(UIView *)superview
                                                                              subview:(UIView *)subview
                                                                               height:(CGFloat)height;

/*!
 pins the subview to the top, left and right with its LayoutMarginsGuide.
 @param superview the superview
 @param subview the subview
 @param height the height of the subview
 @returns the layout constraints
 */
+ (NSArray<NSLayoutConstraint *> *)pinItemToTopWithTopLeadingTrailingLayoutMarginsGuideWithSuperView:(UIView *)superview
                                                                                             subview:(UIView *)subview
                                                                                              height:(CGFloat)height;

/*!
 sets the subview constraints to match the superview.
 @param superview the superview
 @param subview the subview
 */
+ (void)widthHeightEquivalentsConstraintsWithSuperView:(UIView *)superview
                                               subview:(UIView *)subview;

/*!
 sets the subview constraints to match the superview LayoutMarginsGuide.
 @param superview the superview
 @param subview the subview
 */
+ (void)widthHeightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview
                                                                   subview:(UIView *)subview;

/*!
 sets the subviews constraints to be evenly distributed vertically across the superview to its edges.
 @param superview the superview
 @param subviews the subview
 @param alignment the alignment
 @param distribution the distribution
 @param axis the axis
 */
+ (void)evenConstraintsWithSuperView:(UIView *)superview
                            subviews:( NSArray<UIView *> *)subviews
                           alignment:(UIStackViewAlignment)alignment
                        distribution:(UIStackViewDistribution)distribution
                                axis:(UILayoutConstraintAxis)axis;

/*!
 sets the subviews constraints to be evenly distributed vertically across the superview to its LayoutMarginsGuide.
 @param superview the superview
 @param subviews the subview
 @param alignment the alignment
 @param distribution the distribution
 @param axis the axis
 */
+ (void)evenConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview
                                                subviews:(NSArray<UIView *> *)subviews
                                               alignment:(UIStackViewAlignment)alignment
                                            distribution:(UIStackViewDistribution)distribution
                                                    axis:(UILayoutConstraintAxis)axis;

/*!
 centers the subview on the the superview
 @param superview the superview
 @param subview the subview
 @param height the height of the subview
 @returns the layout constraints
 */
+ (NSArray<NSLayoutConstraint *> *)pinItemtoCenterOfSuperView:(UIView *)superview
                                                      subview:(UIView *)subview
                                                        width:(CGFloat)width
                                                       height:(CGFloat)height;

/*!
 sets the subview on the the superview with height and width contraints only
 @param superview the superview
 @param subview the subview
 @param height the height of the subview
 @returns the layout constraints
 */
+ (NSArray<NSLayoutConstraint *> *)constraintsForWidthAndHeightOnSuperView:(UIView *)superview
                                                                   subview:(UIView *)subview
                                                                     width:(CGFloat)width
                                                                    height:(CGFloat)height;

@end

NS_ASSUME_NONNULL_END
