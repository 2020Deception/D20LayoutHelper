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
 pins the subview to the top of the superview
 @param superview the superview
 @param subview the subview
 @param height the height of the subview
 @returns the layout constraints
 */
+ (NSArray<NSLayoutConstraint *> *)pinItemToTopWithSuperView:(UIView *)superview
                                                     subview:(UIView *)subview
                                                      height:(CGFloat)height;

/*!
 sets the subview constraints to match the superview
 @param superview the superview
 @param subview the subview
 */
+ (void)widthHeightEquivalentsConstraintsWithSuperView:(UIView *)superview
                                               subview:(UIView *)subview;

/*!
 sets the subviews constraints to be evenly distributed vertically
 @param superview the superview
 @param subviews the subview
 */
+ (void)evenVerticalConstraintsWithSuperView:(UIView *)superview
                                    subviews:( NSArray<UIView *> *)subviews;

/*!
 sets the subviews constraints to be evenly distributed horizontally
 @param superview the superview
 @param subviews the subview
 */
+ (void)evenHorizontalConstraintsWithSuperView:(UIView *)superview
                                      subviews:( NSArray<UIView *> *)subviews;

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
                                                                forSubview:(UIView *)subview
                                                                     width:(CGFloat)width
                                                                    height:(CGFloat)height;

@end

NS_ASSUME_NONNULL_END
