//
//  BLSmartLayoutCustomLayout.m
//  BLSmartLayoutEngineDemo
//
//  Created by arlin on 2016/6/13.
//  Copyright © 2016年 9game. All rights reserved.
//

#import "BLSmartLayoutCustomLayout.h"

@implementation BLSmartLayoutCustomLayout

+ (void)bls_layoutViews:(UIView*)superView
{
    // Layout All subviews
    if ( superView.subviews.count == 0 )
    {
        return;
    }
    
    CGFloat subviewWidth = superView.frame.size.width * 2.0 / 3.0;
    CGFloat subviewHeight = superView.frame.size.height / superView.subviews.count;
    CGFloat leftOffset = 0.0;
    
    if ( superView.subviews.count > 1 )
    {
        leftOffset = (superView.frame.size.width - subviewWidth) / (superView.subviews.count - 1);
    }
    
    for ( int i = 0; i < superView.subviews.count; i++ )
    {
        UIView *subview = [superView.subviews objectAtIndex:i];
        subview.frame = CGRectMake(i * leftOffset, i * subviewHeight, subviewWidth, subviewHeight);
    }
}

@end
