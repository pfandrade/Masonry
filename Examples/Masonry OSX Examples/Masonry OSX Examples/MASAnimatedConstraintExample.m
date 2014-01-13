//
//  MASAnimatedConstraintExample.m
//  Masonry OSX Examples
//
//  Created by Paulo F. Andrade on 09/01/14.
//  Copyright (c) 2014 Masonry. All rights reserved.
//

#import "MASAnimatedConstraintExample.h"
#import <QuartzCore/QuartzCore.h>

@implementation MASAnimatedConstraintExample

- (void)setupExampleInView:(NSView *)view
{
    NSView *firstView = [[NSView alloc] initWithFrame:CGRectZero];
    [firstView setWantsLayer:YES];
    firstView.layer.borderColor = [NSColor redColor].CGColor;
    firstView.layer.borderWidth = 2;
    firstView.layer.backgroundColor = [[NSColor redColor] colorWithAlphaComponent:0.7].CGColor;
    
    NSView *secondView = [[NSView alloc] initWithFrame:CGRectZero];
    [secondView setWantsLayer:YES];
    secondView.layer.borderColor = [NSColor greenColor].CGColor;
    secondView.layer.borderWidth = 2;
    secondView.layer.backgroundColor = [[NSColor greenColor] colorWithAlphaComponent:0.7].CGColor;
    
    
    
    [firstView addSubview:secondView];
    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(firstView).with.insets(NSEdgeInsetsMake(5, 10, 5, 10));
    }];

    __block id<MASConstraint> widthConstraint = nil;
    __block id<MASConstraint> centerYConstraint = nil;
    [view addSubview:firstView];
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view);
        centerYConstraint = make.centerY.equalTo(view);
        widthConstraint = make.width.equalTo(@200);
        make.height.equalTo(@50);
    }];
    
    
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
    } completionHandler:^{

        [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
            [context setAllowsImplicitAnimation:YES];
            [context setDuration:1.0];
            widthConstraint.animator.equalTo(@50);
            centerYConstraint.animator.offset(50);
        } completionHandler:^{
            
        }];
        
    }];
    
}

@end
