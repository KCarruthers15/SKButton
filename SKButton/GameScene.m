//
//  GameScene.m
//  SKButton
//
//  Created by Kyle Carruthers on 2015-09-30.
//  Copyright (c) 2015 Kyle Carruthers. All rights reserved.
//

#import "GameScene.h"
#import "SKButton.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    CGPoint position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    SKButton *button = [[SKButton alloc] initWithText:@"Button" fontName:@"Chalkduster" atPosition:position withOnTouchAction:^{ NSLog(@"Pressed!"); }];
    
    [self addChild:button];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
