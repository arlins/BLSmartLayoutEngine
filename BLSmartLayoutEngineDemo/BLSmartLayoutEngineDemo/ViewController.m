//
//  ViewController.m
//  BLSmartLayoutEngineDemo
//
//  Created by arlin on 16/5/5.
//  Copyright © 2016年 arlin. All rights reserved.
//

#import "ViewController.h"
#import "BLSmartLayoutEngine.h"


const CGFloat KViewContrllerSpacing = 20.0;

#pragma mark UIColor(RandomColor)

@interface UIColor(RandomColor)

+ (UIColor *)randomColor;

@end

@implementation UIColor (RandomColor)

+ (UIColor *)randomColor {
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end

#pragma mark ViewController

@interface ViewController ()

@property (nonatomic, retain) UIView *contentView;

- (UIView *)createHBoxItem:(NSUInteger)tag;
- (UIView *)createVBoxItem:(NSUInteger)tag;
- (UIView *)createAnchorItem:(NSUInteger)tag;

@end

@implementation ViewController

- (void)dealloc
{
    [_contentView release];
    _contentView = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.bls_layoutType = BLSmartLayoutTypeVBox;
    self.view.bls_spacing = 10.0;
    self.view.bls_margins = UIEdgeInsetsMake(KViewContrllerSpacing, KViewContrllerSpacing, -KViewContrllerSpacing, -KViewContrllerSpacing);
    
    UIView *topView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [addButton setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.2]];
    [addButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(onAddButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:addButton];
    
    UIButton *reduceButton = [[[UIButton alloc] initWithFrame:CGRectZero] autorelease];
    [reduceButton setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.2]];
    [reduceButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [reduceButton setTitle:@"-" forState:UIControlStateNormal];
    [reduceButton addTarget:self action:@selector(onReduceButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:reduceButton];
    
    UIButton *newButton = [[[UIButton alloc] initWithFrame:CGRectZero] autorelease];
    [newButton setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.2]];
    [newButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [newButton setTitle:@"show" forState:UIControlStateNormal];
    [newButton addTarget:self action:@selector(onNewButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:newButton];
    
    UIButton *dismissButton = [[[UIButton alloc] initWithFrame:CGRectZero] autorelease];
    [dismissButton setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.2]];
    [dismissButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [dismissButton setTitle:@"hide" forState:UIControlStateNormal];
    [dismissButton addTarget:self action:@selector(onDismissButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:dismissButton];
    
    topView.bls_layoutType = BLSmartLayoutTypeHBox;
    topView.bls_fixedHeight = 25.0;
    topView.bls_spacing = 10.0;
    [self.view addSubview:topView];
    
    self.contentView = [[[UIView alloc] init] autorelease];
    self.contentView.backgroundColor = [UIColor grayColor];
    self.contentView.bls_layoutType = BLSmartLayoutTypeHBox;
    self.contentView.bls_margins = UIEdgeInsetsMake(10, 10, -10, -10);
    self.contentView.bls_spacing = 20;
    
    for ( int i = 0; i < 3; i++ )
    {
        UIView *hBoxView = ( i % 2 == 0 ? [self createVBoxItem:i] : [self createHBoxItem:i] );
        [self.contentView addSubview:hBoxView];
    }

    [self.view addSubview:self.contentView];
}

- (UIView *)createHBoxItem:(NSUInteger)tag
{
    UIColor *color = [UIColor randomColor];
    UIView *view = [[[UIView alloc] init] autorelease];
    view.tag = tag;
    view.backgroundColor = color;
    view.bls_layoutType = BLSmartLayoutTypeHBox;
    view.bls_spacing = 3.0;
    
    for ( int j = 200; j < 202; j++ )
    {
        UIView *vBoxView = [self createAnchorItem:j];
        [view addSubview:vBoxView];
    }
    
    return view;
}

- (UIView *)createVBoxItem:(NSUInteger)tag
{
    UIColor *color = [UIColor randomColor];
    
    UIView *view = [[[UIView alloc] init] autorelease];
    view.tag = tag;
    view.backgroundColor = color;
    view.bls_layoutType = BLSmartLayoutTypeVBox;
    view.bls_spacing = 20.0;
    
    if ( tag == 0 )
    {
        view.bls_itemSpacing = 10.0;
    };
    
    if ( tag == 2 )
    {
        view.bls_fixedWidth = 60.0;
    }
    
    for ( int j = 200; j < 203; j++ )
    {
        UIView* vBoxView = [self createAnchorItem:j];
        [view addSubview:vBoxView];
    }
    
    return view;
}

- (UIView *)createAnchorItem:(NSUInteger)tag
{
    UIColor *color = [UIColor randomColor];
    UIView *view = [[[UIView alloc] init] autorelease];
    view.bls_layoutType = BLSmartLayoutTypeAnchor;
    view.tag = tag;
    view.backgroundColor = color;
    
    BLSmartLayoutAnchorInfo *anchorInfo = nil;
    
    //left-top
    UILabel* label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
    label.text = @"lt";
    label.backgroundColor = [UIColor redColor];
    
    anchorInfo = [[[BLSmartLayoutAnchorInfo alloc] init] autorelease];
    anchorInfo.bls_leftAnchor = UIEdgeInsetsMake(0.0, 2.0, 0.0, 0.0);
    anchorInfo.bls_topAnchor = UIEdgeInsetsMake(2.0, 0.0, 0.0, 0.0);
    anchorInfo.bls_rightAnchor = UIEdgeInsetsMake(0.0, 20.0, 0.0, 0.0);
    anchorInfo.bls_bottomAnchor = UIEdgeInsetsMake(22.0, 0.0, 0.0, 0.0);
    
    label.bls_anchorInfo = anchorInfo;
    [view addSubview:label];
    
    //right-top
    label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
    label.text = @"rt";
    label.backgroundColor = [UIColor redColor];
    
    anchorInfo = [[[BLSmartLayoutAnchorInfo alloc] init] autorelease];
    anchorInfo.bls_leftAnchor = UIEdgeInsetsMake(0.0, 0.0, 0.0, 20.0);
    anchorInfo.bls_topAnchor = UIEdgeInsetsMake(2.0, 0.0, 0.0, 0.0);
    anchorInfo.bls_rightAnchor = UIEdgeInsetsMake(0.0, 0.0, 0.0, 2.0);
    anchorInfo.bls_bottomAnchor = UIEdgeInsetsMake(22.0, 0.0, 0.0, 0.0);
    
    label.bls_anchorInfo = anchorInfo;
    [view addSubview:label];
    
    //left-bottom
    label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
    label.text = @"lb";
    label.backgroundColor = [UIColor redColor];
    
    anchorInfo = [[[BLSmartLayoutAnchorInfo alloc] init] autorelease];
    anchorInfo.bls_leftAnchor = UIEdgeInsetsMake(0.0, 2.0, 0.0, 0.0);
    anchorInfo.bls_topAnchor = UIEdgeInsetsMake(0.0, 0.0, 22.0, 0.0);
    anchorInfo.bls_rightAnchor = UIEdgeInsetsMake(0.0, 20.0, 0.0, 0.0);
    anchorInfo.bls_bottomAnchor = UIEdgeInsetsMake(0.0, 0.0, 2.0, 0.0);
    
    label.bls_anchorInfo = anchorInfo;
    [view addSubview:label];
    
    //right-bottom
    label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
    label.text = @"rb";
    label.backgroundColor = [UIColor redColor];
    
    anchorInfo = [[[BLSmartLayoutAnchorInfo alloc] init] autorelease];
    anchorInfo.bls_leftAnchor = UIEdgeInsetsMake(0.0, 0.0, 0.0, 20.0);
    anchorInfo.bls_topAnchor = UIEdgeInsetsMake(0.0, 0.0, 22.0, 0.0);
    anchorInfo.bls_rightAnchor = UIEdgeInsetsMake(0.0, 0.0, 0.0, 2.0);
    anchorInfo.bls_bottomAnchor = UIEdgeInsetsMake(0.0, 0.0, 2.0, 0.0);
    
    label.bls_anchorInfo = anchorInfo;
    [view addSubview:label];
    
    return view;
}

- (void)onAddButtonClicked:(id)sender
{
    UIView *subView = [self.contentView viewWithTag:1];
    if ( subView )
    {
        CGFloat bls_fixedWidth = subView.bls_fixedWidth;
        bls_fixedWidth += 30.0;
        bls_fixedWidth = MAX(0.0, bls_fixedWidth);
        
        
        [UIView animateWithDuration:0.3 animations:^{
            subView.bls_fixedWidth = bls_fixedWidth;
            [subView.superview bls_layoutSubViews];
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)onReduceButtonClicked:(id)sender
{
    UIView *subView = [self.contentView viewWithTag:1];
    if ( subView )
    {
        CGFloat bls_fixedWidth = subView.bls_fixedWidth;
        bls_fixedWidth -= 30.0;
        bls_fixedWidth = MAX(0.0, bls_fixedWidth);

        
        [UIView animateWithDuration:0.3 animations:^{
            subView.bls_fixedWidth = bls_fixedWidth;
            [subView.superview bls_layoutSubViews];
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)onNewButtonClicked:(id)sender
{
    ViewController *viewController = [[[ViewController alloc] init] autorelease];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)onDismissButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
