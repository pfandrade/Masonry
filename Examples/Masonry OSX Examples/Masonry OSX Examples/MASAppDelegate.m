//
//  MASAppDelegate.m
//  Masonry OSX Examples
//
//  Created by Paulo F. Andrade on 09/01/14.
//  Copyright (c) 2014 Masonry. All rights reserved.
//

#import "MASAppDelegate.h"
#import "MASAnimatedConstraintExample.h"
@implementation MASAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSView *view = [[NSView alloc] initWithFrame:CGRectZero];
    MASAnimatedConstraintExample *example1 = [MASAnimatedConstraintExample new];
    [example1 setupExampleInView:view];
    
    [self.stageView setContentView:view];
    
}

@end
