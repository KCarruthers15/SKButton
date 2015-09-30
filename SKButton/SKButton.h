//
//  SKButton.h
//  Freebooters
//
//  Created by Kyle Carruthers on 2015-05-08.
//  Copyright (c) 2015 Kyle Carruthers. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKButton : SKNode

@property (assign, nonatomic) int fontSize;

- (id)initWithText:(NSString *)text fontName:(NSString *)fontName atPosition:(CGPoint)position withOnTouchAction:(void(^)(void))onTouchAction;

- (id)initWithText:(NSString *)text fontName:(NSString *)fontName fontColor:(SKColor *)color fontSize:(int)fontSize atPosition:(CGPoint)position withOnTouchAction:(void(^)(void))onTouchAction;

- (id)initWithText:(NSString *)text fontName:(NSString *)fontName fontColor:(SKColor *)color fontSize:(int)fontSize atPosition:(CGPoint)position withHorizontalFontAlignment:(SKLabelHorizontalAlignmentMode)horizontalAlignment andVerticalAlignment:(SKLabelVerticalAlignmentMode)verticalAlignment withOnTouchAction:(void(^)(void))onTouchAction;

- (void)setText:(NSString *)text;
- (void)setFontColor:(SKColor *)fontColor;
- (void)setOnTouchAction:(void(^)(void))onTouchAction;
- (void)setEnabled:(BOOL)isEnabled;

@end
