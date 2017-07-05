## BLSmartLayoutEngine

`BLSmartLayoutEngine` is a lightweight layout engine for iOS.

## About

`BLSmartLayoutEngine` is a lightweight layout engine for iOS,here are the reasons why we make it:

1: Some layout engines people using now,such as autoresizing, auto-layout,and Masonry,it is complicated. 

2: BLSmartLayoutEngine is easy to learn and use, unlike auto-layout,it does not depend on any advanced system version,  so you have no need to consider the system versions.

3: Somewhere we may want to layout UI dynamically.

4: ...

## Requirements

iOS 7.0 or later

## CocoaPods

```objc
pod 'BLSmartLayoutEngine', '1.0.2'
```

## Usage

Layout all subviews with same width horizontal(HBox) , space between subviews is 20.0 px

```objc
UIView* containterView = [[UIView alloc] init];
containterView.bls_layoutType = BLSmartLayoutTypeHBox;
containterView.bls_spacing = 20.0;
for ( int j = 0; j < 4; j++ )  {
    UIView* subView =[[UIView alloc] init];
    [containterView addSubview:subView];
}
```

Layout all subviews with same height vertical(VBox), space between subviews is 20.0 px

```objc
UIView* containterView = [[UIView alloc] init];
containterView.bls_layoutType = BLSmartLayoutTypeVBox;
containterView.bls_spacing = 20.0;
for ( int j = 0; j < 4; j++ ) {
    UIView* subView =[[UIView alloc] init];
    [containterView addSubview:subView];
}
```

Layout subviews in Anchor style

```objc
UIView* view = [[UIView alloc] init]; 
view.bls_layoutType = BLSmartLayoutTypeAnchor;
BLSmartLayoutAnchorInfo* anchorInfo = nil;

//left-top
UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
label.text = @"lt";
label.backgroundColor = [UIColor redColor];
anchorInfo = [[BLSmartLayoutAnchorInfo alloc] init];
anchorInfo.bls_leftAnchor = UIEdgeInsetsMake(0.0, 2.0, 0.0, 0.0);
anchorInfo.bls_topAnchor = UIEdgeInsetsMake(2.0, 0.0, 0.0, 0.0);
anchorInfo.bls_rightAnchor = UIEdgeInsetsMake(0.0, 20.0, 0.0, 0.0);
anchorInfo.bls_bottomAnchor = UIEdgeInsetsMake(22.0, 0.0, 0.0, 0.0);
label.bls_anchorInfo = anchorInfo;
[view addSubview:label];

//right-top
label = [[UILabel alloc] initWithFrame:CGRectZero];
label.text = @"rt";
label.backgroundColor = [UIColor redColor];
anchorInfo = [[BLSmartLayoutAnchorInfo alloc] init];
anchorInfo.bls_leftAnchor = UIEdgeInsetsMake(0.0, 0.0, 0.0, 20.0);
anchorInfo.bls_topAnchor = UIEdgeInsetsMake(2.0, 0.0, 0.0, 0.0);
anchorInfo.bls_rightAnchor = UIEdgeInsetsMake(0.0, 0.0, 0.0, 2.0);
anchorInfo.bls_bottomAnchor = UIEdgeInsetsMake(22.0, 0.0, 0.0, 0.0);
label.bls_anchorInfo = anchorInfo;
[view addSubview:label];

//left-bottom 
label = [[UILabel alloc] initWithFrame:CGRectZero];
label.text = @"lb";
label.backgroundColor = [UIColor redColor];
anchorInfo = [[BLSmartLayoutAnchorInfo alloc] init];
anchorInfo.bls_leftAnchor = UIEdgeInsetsMake(0.0, 2.0, 0.0, 0.0);
anchorInfo.bls_topAnchor = UIEdgeInsetsMake(0.0, 0.0, 22.0, 0.0);
anchorInfo.bls_rightAnchor = UIEdgeInsetsMake(0.0, 20.0, 0.0, 0.0);
anchorInfo.bls_bottomAnchor = UIEdgeInsetsMake(0.0, 0.0, 2.0, 0.0);
label.bls_anchorInfo = anchorInfo;
[view addSubview:label];

//right-bottom
label = [[UILabel alloc] initWithFrame:CGRectZero];
label.text = @"rb";
label.backgroundColor = [UIColor redColor];
anchorInfo = [[BLSmartLayoutAnchorInfo alloc] init];
anchorInfo.bls_leftAnchor = UIEdgeInsetsMake(0.0, 0.0, 0.0, 20.0);
anchorInfo.bls_topAnchor = UIEdgeInsetsMake(0.0, 0.0, 22.0, 0.0);
anchorInfo.bls_rightAnchor = UIEdgeInsetsMake(0.0, 0.0, 0.0, 2.0);
anchorInfo.bls_bottomAnchor = UIEdgeInsetsMake(0.0, 0.0, 2.0, 0.0);
label.bls_anchorInfo = anchorInfo;
[view addSubview:label];
```

Make custom layout style

1: Implementation a subclass inherit from `BLSmartLayout`

```objc
@interface CustomSmartLayout : BLSmartLayout 
+ (void)bls_layoutViews:(UIView*)superView;
@end

@implementation CustomSmartLayout
+ (void)bls_layoutViews:(UIView*)superView {
    //TODO:layout subviews
}
@end
```

2: Regist subclass

```objc
[UIView bls_registLayoutClass:[CustomSmartLayout class] layoutType:BLSmartLayoutTypeUser + 100];
```

3: Using the new layout style

```objc
UIView* view = [[UIView alloc] init];
view.bls_layoutType = BLSmartLayoutTypeUser + 100;
```

Look through the demo,you will find the way quickly.
