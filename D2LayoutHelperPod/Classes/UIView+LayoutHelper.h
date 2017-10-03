//
//  UIView+LayoutHelper.h
//  D2LayoutHelperPod
//
//  Created by Brian Sharrief Alim Bowman on 9/18/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LayoutHelper)

- (void)setHeightConstant:(NSInteger)constant;
- (void)setWidthConstant:(NSInteger)constant;
- (void)setHeightConstant:(NSInteger)heightConstant widthConstant:(NSInteger)widthConstant;
- (NSArray<NSLayoutConstraint*>*)centerHorizontally:(UIView*)superview;
- (NSArray<NSLayoutConstraint*>*)centerVertically:(UIView*)superview;
- (void)centerAndSquareItemToFillSuperview:(UIView*)superview;
- (void)centerItemBelowItem:(UIView *)topview superview:(UIView*)superview width:(CGFloat)width height:(CGFloat)height;
- (void)centerItemBelowItem:(UIView *)topview superview:(UIView*)superview width:(CGFloat)width height:(CGFloat)height constant:(CGFloat)constant;
- (void)centerItemWithLayoutMarginsGuideBelowItem:(UIView *)topview superview:(UIView*)superview width:(CGFloat)width height:(CGFloat)height constant:(CGFloat)constant;
- (void)centerItemWithLayoutMarginsGuideBelowItem:(UIView *)topview superview:(UIView*)superview width:(CGFloat)width height:(CGFloat)height;
- (void)centerItemAboveItem:(UIView *)bottomview superview:(UIView*)superview width:(CGFloat)width height:(CGFloat)height;
- (void)centerItemAboveItem:(UIView *)bottomview superview:(UIView*)superview width:(CGFloat)width height:(CGFloat)height constant:(CGFloat)constant;
- (void)centerItemWithLayoutMarginsGuideAboveItem:(UIView *)topview superview:(UIView*)superview width:(CGFloat)width height:(CGFloat)height constant:(CGFloat)constant;
// follows topview leading/trailing constraints
- (void)fillViewBetween:(UIView *)topView bottomView:(UIView *)bottomView superview:(UIView *)superview topPadding:(CGFloat)topPadding bottomPadding:(CGFloat)bottomPadding;
- (void)stackViewBelowView:(UIView *)topView superview:(UIView*)superview height:(CGFloat)height constant:(CGFloat)constant;
- (void)stackViewBelowView:(UIView *)topView superview:(UIView*)superview height:(CGFloat)height;
- (void)stackViewAboveView:(UIView *)bottomView superview:(UIView*)superview height:(CGFloat)height constant:(CGFloat)constant;
- (void)stackViewAboveView:(UIView *)bottomView superview:(UIView*)superview height:(CGFloat)height;

/*!
 sets the subview constraints to match the superview.
 @param superview the superview
 */
- (void)widthHeightEquivalentsConstraintsWithSuperView:(UIView *)superview;

/*!
 sets the subview constraints to match the superview.
 @param superview the superview
 @param constants top, right, bottom, left constants in their respective order
 */
- (void)widthHeightEquivalentsConstraintsWithSuperView:(UIView *)superview constants:(float[_Nonnull 4])constants;

/*!
 sets the subview constraints to match the superview via its LayoutMarginsGuide.
 @param superview the superview
 */
- (void)widthHeightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview;

/*!
 sets the subview constraints to match the superview via its LayoutMarginsGuide.
 @param superview the superview
 @param constants top, right, bottom, left constants in their respective order
 */
- (void)widthHeightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview constants:(float[_Nonnull 4])constants;

/*!
 sets the subview width constraints to match the superview.
 @param superview the superview
 */
- (void)widthEquivalentsConstraintsWithSuperView:(UIView *)superview;

/*!
 sets the subview width constraints to match the superview.
 @param superview the superview
 @param constants leading, trailing constants in their respective order
 */
- (void)widthEquivalentsConstraintsWithSuperView:(UIView *)superview constants:(float[_Nonnull 2])constants;

/*!
 sets the subview width constraints to match the superview via its LayoutMarginsGuide.
 @param superview the superview
 */
- (void)widthEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview;
/*!
 sets the subview width constraints to match the superview via its LayoutMarginsGuide.
 @param superview the superview
 @param constants leading, trailing constants in their respective order
 */
- (void)widthEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview constants:(float[_Nonnull 2])constants;

/*!
 sets the subview height constraints to match the superview.
 @param superview the superview
 */
- (void)heightEquivalentsConstraintsWithSuperView:(UIView *)superview;
/*!
 sets the subview height constraints to match the superview.
 @param superview the superview
 @param constants top, bottom constants in their respective order
 */
- (void)heightEquivalentsConstraintsWithSuperView:(UIView *)superview constants:(float[_Nonnull 2])constants;

/*!
 sets the subview height constraints to match the superview via its LayoutMarginsGuide.
 @param superview the superview
 */
- (void)heightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview;
/*!
 sets the subview height constraints to match the superview via its LayoutMarginsGuide.
 @param superview the superview
 @param constants top, bottom constants in their respective order
 */
- (void)heightEquivalentsConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview constants:(float[_Nonnull 2])constants;

/*!
 sets the subviews to be evenly distributed across the superview to its edges.
 @param superview the superview
 @param subviews the subviews
 @param alignment the alignment
 @param distribution the distribution
 @param axis the axis
 @param spacing the spacing between items
 @returns the stackview
 */
+ (UIStackView *)evenConstraintsWithSuperView:(UIView *)superview
                                     subviews:( NSArray<UIView *> *)subviews
                                    alignment:(UIStackViewAlignment)alignment
                                 distribution:(UIStackViewDistribution)distribution
                                         axis:(UILayoutConstraintAxis)axis
                                      spacing:(CGFloat)spacing;

/*!
 sets the subviews to be evenly distributed across the superview to its LayoutMarginsGuide.
 @param superview the superview
 @param subviews the subviews
 @param alignment the alignment
 @param distribution the distribution
 @param axis the axis
 @param spacing the spacing between items
 @returns the stackview
 */
+ (UIStackView *)evenConstraintsByLayoutMarginsGuideWithSuperView:(UIView *)superview
                                                         subviews:(NSArray<UIView *> *)subviews
                                                        alignment:(UIStackViewAlignment)alignment
                                                     distribution:(UIStackViewDistribution)distribution
                                                             axis:(UILayoutConstraintAxis)axis
                                                          spacing:(CGFloat)spacing;

/*!
 pins the subview to the top, leading and trailing edges of the superview, similar to the placement of a navigation bar.
 @param superview the superview
 @param height the height of the subview
 @returns the layout height constraints
 */
- (NSArray<NSLayoutConstraint *> *)pinItemToTopWithSuperView:(UIView *)superview height:(CGFloat)height;
/*!
 pins the subview to the top, leading and trailing edges of the superview, similar to the placement of a navigation bar.
 @param superview the superview
 @param height the height of the subview
 @param constants leading, top, trailing constants in that order
 @returns the layout height constraints
 */
- (NSArray<NSLayoutConstraint *> *)pinItemToTopWithSuperView:(UIView *)superview height:(CGFloat)height
                                                   constants:(float[_Nonnull 3])constants;

/*!
 pins the subview to the top of the superview via its LayoutMarginsGuide, leading and trailing edges of the superview.
 @param superview the superview
 @param height the height of the subview
 @returns the layout height constraints
 */
- (NSArray<NSLayoutConstraint *> *)pinItemToTopByTopLayoutMarginsGuideWithSuperView:(UIView *)superview height:(CGFloat)height;
/*!
 pins the subview to the top of the superview via its LayoutMarginsGuide, leading and trailing edges of the superview.
 @param superview the superview
 @param height the height of the subview
 @param constants leading, top, trailing constants in that order
 @returns the layout height constraints
 */
- (NSArray<NSLayoutConstraint *> *)pinItemToTopByTopLayoutMarginsGuideWithSuperView:(UIView *)superview height:(CGFloat)height
                                                                          constants:(float[_Nonnull 3])constants;

/*!
 pins the subview to the top, leading and trailing edges of the superview via its LayoutMarginsGuide.
 @param superview the superview
 @param height the height of the subview
 @returns the layout height constraints
 */
- (NSArray<NSLayoutConstraint *> *)pinItemToTopByLayoutMarginsGuideWithSuperView:(UIView *)superview height:(CGFloat)height;
/*!
 pins the subview to the top, leading and trailing edges of the superview via its LayoutMarginsGuide.
 @param superview the superview
 @param height the height of the subview
 @param constants leading, top, trailing constants in that order
 @returns the layout height constraints
 */
- (NSArray<NSLayoutConstraint *> *)pinItemToTopByLayoutMarginsGuideWithSuperView:(UIView *)superview
                                                                          height:(CGFloat)height
                                                                       constants:(float[_Nonnull 3])constants;

/*!
 pins item to the center of it superview, you must separetly set the height and width.
 @param superview the superview
 @returns the layout x, y constraints
 */
- (NSArray<NSLayoutConstraint *> *)pinItemtoCenterOfSuperView:(UIView *)superview;

/*!
 sets the subviews constraints to be evenly distributed across the superview to its edges from the center.
 @param superview the superview
 @param subviews the subviews
 @param alignment the alignment
 @param distribution the distribution
 @param axis the axis
 @param spacing the spacing between items
 @returns the layout x, y constraints
 */
+ (NSArray<NSLayoutConstraint *> *)centeredItemsWithSuperView:(UIView *)superview
                                                     subviews:( NSArray<UIView *> *)subviews
                                                    alignment:(UIStackViewAlignment)alignment
                                                 distribution:(UIStackViewDistribution)distribution
                                                         axis:(UILayoutConstraintAxis)axis
                                                      spacing:(CGFloat)spacing;

/*!
 sets the subviews constraints to be evenly distributed across the superview to its LayoutMarginsGuide from the center.
 @param superview the superview
 @param subviews the subviews
 @param alignment the alignment
 @param distribution the distribution
 @param axis the axis
 @param spacing the spacing between items
 @returns the layout x, y constraints
 */
+ (NSArray<NSLayoutConstraint *> *)centeredItemsByLayoutMarginsGuideWithSuperView:(UIView *)superview
                                                                         subviews:(NSArray<UIView *> *)subviews
                                                                        alignment:(UIStackViewAlignment)alignment
                                                                     distribution:(UIStackViewDistribution)distribution
                                                                             axis:(UILayoutConstraintAxis)axis
                                                                          spacing:(CGFloat)spacing;

/*!
 centers the subview on the the superview
 @param superview the superview
 @param height the height of the subview
 @returns the layout height, width, x, y constraints
 */
- (NSArray<NSLayoutConstraint *> *)pinItemtoCenterOfSuperView:(UIView *)superview
                                                        width:(CGFloat)width
                                                       height:(CGFloat)height;

/*!
 pins the subview to the bottom, leading and trailing edges of the superview, similar to the placement of a navigation bar.
 @param superview the superview
 @param height the height of the subview
 @returns the layout height constraints
 */
- (NSArray<NSLayoutConstraint *> *)pinItemToBottomWithSuperView:(UIView *)superview
                                                         height:(CGFloat)height;
/*!
 pins the subview to the bottom, leading and trailing edges of the superview, similar to the placement of a navigation bar.
 @param superview the superview
 @param height the height of the subview
 @param constants leading, bottom, trailing constants in that order
 @returns the layout height constraints
 */
- (NSArray<NSLayoutConstraint *> *)pinItemToBottomWithSuperView:(UIView *)superview
                                                         height:(CGFloat)height
                                                      constants:(float[_Nonnull 3])constants;

/*!
 pins the subview to the bottom of the superview via its LayoutMarginsGuide, leading and trailing edges of the superview.
 @param superview the superview
 @param height the height of the subview
 @returns the layout height constraints
 */
- (NSArray<NSLayoutConstraint *> *)pinItemToBottomByBottomLayoutMarginsGuideWithSuperView:(UIView *)superview
                                                                                   height:(CGFloat)height;
/*!
 pins the subview to the bottom of the superview via its LayoutMarginsGuide, leading and trailing edges of the superview.
 @param superview the superview
 @param height the height of the subview
 @param constants leading, bottom, trailing constants in that order
 @returns the layout height constraints
 */
- (NSArray<NSLayoutConstraint *> *)pinItemToBottomByBottomLayoutMarginsGuideWithSuperView:(UIView *)superview
                                                                                   height:(CGFloat)height
                                                                                constants:(float[_Nonnull 3])constants;

/*!
 pins the subview to the bottom, leading and trailing edges of the superview via its LayoutMarginsGuide.
 @param superview the superview
 @param height the height of the subview
 @returns the layout height constraints
 */
- (NSArray<NSLayoutConstraint *> *)pinItemToBottomByLayoutMarginsGuideWithSuperView:(UIView *)superview
                                                                             height:(CGFloat)height;
/*!
 pins the subview to the bottom, leading and trailing edges of the superview via its LayoutMarginsGuide.
 @param superview the superview
 @param height the height of the subview
 @param constants leading, bottom, trailing constants in that order
 @returns the layout height constraints
 */
- (NSArray<NSLayoutConstraint *> *)pinItemToBottomByLayoutMarginsGuideWithSuperView:(UIView *)superview
                                                                             height:(CGFloat)height
                                                                          constants:(float[_Nonnull 3])constants;

/*!
 sets the subview on the the superview with height and width contraints only
 @param superview the superview
 @param height the height of the subview
 @returns the layout height, width constraints
 */
- (NSArray<NSLayoutConstraint *> *)constraintsForWidthAndHeightOnSuperView:(UIView *)superview
                                                                     width:(CGFloat)width
                                                                    height:(CGFloat)height;

@end

NS_ASSUME_NONNULL_END
