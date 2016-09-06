# D2LayoutHelperPod

[![CI Status](http://img.shields.io/travis/Brian Bowman/D2LayoutHelperPod.svg?style=flat)](https://travis-ci.org/Brian Bowman/D2LayoutHelperPod)
[![Version](https://img.shields.io/cocoapods/v/D2LayoutHelperPod.svg?style=flat)](http://cocoapods.org/pods/D2LayoutHelperPod)
[![License](https://img.shields.io/cocoapods/l/D2LayoutHelperPod.svg?style=flat)](http://cocoapods.org/pods/D2LayoutHelperPod)
[![Platform](https://img.shields.io/cocoapods/p/D2LayoutHelperPod.svg?style=flat)](http://cocoapods.org/pods/D2LayoutHelperPod)

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
```
produces  
![ScreenShot](https://raw.githubusercontent.com/2020Deception/D2LayoutHelperPod/master/Example/D2LayoutHelperPod/sample.png)  

## Author

Brian Bowman, 2020deception@gmail.com

## License

D2LayoutHelperPod is available under the MIT license. See the LICENSE file for more info.
