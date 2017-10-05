# D2LayoutHelperPod

Updated to support iOS 7 -> iOS 11
```
- (UILayoutGuide *)layoutMarginsGuide {
    if (@available(iOS 11.0, *)) {
        return self.safeAreaLayoutGuide;
    } else {
        return self.layoutMarginsGuide;
    }
}
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Info  
  
D2LayoutHelperPod contains helper autolayout functions that will help make your autolayout work much easier :-)  
There are several helper pods that may help simplify things for you. Enjoy!

## Installation

D2LayoutHelperPod is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "D2LayoutHelperPod"
```

From the Example
```
- (void)viewDidLoad {
    [super viewDidLoad];
    // set a view to match the superview
    UIView *green = [UIView new];
    green.backgroundColor = [UIColor greenColor];
    
//    [D20LayoutHelper widthHeightEquivalentsConstraintsWithSuperView:self.view subview:green];
    [green widthHeightEquivalentsConstraintsWithSuperView:self.view];
    [self addTopBar];
}
    
- (void)addTopBar {
    UIView *topView = [UIView new];
    topView.backgroundColor = [UIColor blackColor];
    
    UILabel *navTitle = [UILabel new];
    navTitle.text = @"navigation title here";
    navTitle.textColor = [UIColor blueColor];
    [navTitle sizeToFit];
    
//    [D20LayoutHelper pinItemtoCenterOfSuperView:topView subview:navTitle];
    [navTitle pinItemtoCenterOfSuperView:topView];
//    [D20LayoutHelper pinItemToTopWithSuperView:self.view subview:topView height:60];
    [topView pinItemToTopByLayoutMarginsGuideWithSuperView:self.view height:60];
    
    UIView *marginHighBar = [UIView new];
    marginHighBar.backgroundColor = [UIColor yellowColor];
    
//    [D20LayoutHelper pinItemToTopByLayoutMarginsGuideWithSuperView:topView subview:marginHighBar height:8];
    [marginHighBar pinItemToTopByLayoutMarginsGuideWithSuperView:topView height:8];
    UIView *marginLowBar = [UIView new];
    marginLowBar.backgroundColor = [UIColor yellowColor];
    
//    [D20LayoutHelper pinItemToBottomByLayoutMarginsGuideWithSuperView:topView subview:marginLowBar height:8];
    [marginLowBar pinItemToBottomByLayoutMarginsGuideWithSuperView:topView height:8];
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = [UIColor purpleColor];
    
    UILabel *lowerNavTitle = [UILabel new];
    lowerNavTitle.text = @"add buttons/views/anything here";
    lowerNavTitle.textColor = [UIColor cyanColor];
    [lowerNavTitle sizeToFit];
    
//    [D20LayoutHelper pinItemtoCenterOfSuperView:bottomView subview:navTitle];
    [lowerNavTitle pinItemtoCenterOfSuperView:bottomView];
//    [D20LayoutHelper pinItemToBottomWithSuperView:self.view subview:bottomView height:60];
    [bottomView pinItemToBottomWithSuperView:self.view height:60];
    
    // evenly display some labels vertically
    NSArray<UIView *> *views = [NSArray new];
    
    for (int i = 0;  i < 8; i++) {
        UILabel *someLabel = [UILabel new];
        someLabel.text = [NSString stringWithFormat:@"label #%d", i+1];
        someLabel.backgroundColor = [UIColor magentaColor];
        [someLabel sizeToFit];
        views = [views arrayByAddingObject:someLabel];
    }
    
    //add some labels
    UIView *container = [UIView new];
    [container fillViewBetween:topView bottomView:bottomView superview:self.view topPadding:0 bottomPadding:0];
    
//    [D20LayoutHelper centeredItemsByLayoutMarginsGuideWithSuperView:self.view
//                                                           subviews:views
//                                                          alignment:UIStackViewAlignmentFill
//                                                       distribution:UIStackViewDistributionFillEqually
//                                                               axis:UILayoutConstraintAxisVertical
//                                                            spacing:23];
    
    [UIView evenConstraintsByLayoutMarginsGuideWithSuperView:container
                                                    subviews:views
                                                   alignment:UIStackViewAlignmentFill
                                                distribution:UIStackViewDistributionFillEqually
                                                        axis:UILayoutConstraintAxisVertical
                                                     spacing:23];
    
    [self addMoreLabels];
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
    
//    [D20LayoutHelper evenConstraintsByLayoutMarginsGuideWithSuperView:self.view
//                                         subviews:views
//                                        alignment:UIStackViewAlignmentCenter
//                                     distribution:UIStackViewDistributionFillEqually
//                                             axis:UILayoutConstraintAxisHorizontal
//                                          spacing:0];
    [UIView evenConstraintsByLayoutMarginsGuideWithSuperView:self.view
                                                    subviews:views
                                                   alignment:UIStackViewAlignmentCenter
                                                distribution:UIStackViewDistributionFillEqually
                                                        axis:UILayoutConstraintAxisHorizontal
                                                     spacing:0];
}
```
produces  
![ScreenShot](https://raw.githubusercontent.com/2020Deception/D2LayoutHelperPod/master/Example/D2LayoutHelperPod/sample.png)  
![ScreenShot](https://github.com/2020Deception/D20LayoutHelper/blob/master/Example/D2LayoutHelperPod/sample2.png?raw=true)
## Author

Brian Bowman, 2020deception@gmail.com

## License

D2LayoutHelperPod is available under the MIT license. See the LICENSE file for more info.
