# D2LayoutHelperPod

[![CI Status](http://img.shields.io/travis/Brian Bowman/D2LayoutHelperPod.svg?style=flat)](https://travis-ci.org/Brian Bowman/D2LayoutHelperPod)
[![Version](https://img.shields.io/cocoapods/v/D2LayoutHelperPod.svg?style=flat)](http://cocoapods.org/pods/D2LayoutHelperPod)
[![License](https://img.shields.io/cocoapods/l/D2LayoutHelperPod.svg?style=flat)](http://cocoapods.org/pods/D2LayoutHelperPod)
[![Platform](https://img.shields.io/cocoapods/p/D2LayoutHelperPod.svg?style=flat)](http://cocoapods.org/pods/D2LayoutHelperPod)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

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
    [D20LayoutHelper widthHeightEquivalentsConstraintsWithSuperView:self.view subview:green];
    
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
    
    [D20LayoutHelper evenVerticalConstraintsWithSuperView:self.view subviews:views];
}
```

produces  
![ScreenShot](https://raw.githubusercontent.com/2020Deception/D2LayoutHelperPod/master/Example/D2LayoutHelperPod/vertical.png)  

## Author

Brian Bowman, 2020deception@gmail.com

## License

D2LayoutHelperPod is available under the MIT license. See the LICENSE file for more info.
