//
//  SKButton.m
//  Freebooters
//
//  Created by Kyle Carruthers on 2015-05-08.
//  Copyright (c) 2015 Kyle Carruthers. All rights reserved.
//

#import "SKButton.h"

@interface SKButton ()

@property (strong, nonatomic) SKLabelNode *label;
@property (strong, nonatomic) SKColor *originalColor;
@property (assign, nonatomic) BOOL isEnabled;
@property (copy, nonatomic) void(^onTouch)(void);

@end

@implementation SKButton

- (int)fontSize
{
    return self.label.fontSize;
}

- (id)initWithText:(NSString *)text fontName:(NSString *)fontName atPosition:(CGPoint)position withOnTouchAction:(void(^)(void))onTouchAction
{
    self = [self initWithText:text fontName:fontName fontColor:[SKColor whiteColor] fontSize:15 atPosition:position withOnTouchAction:onTouchAction];
    
    return self;
}

- (id)initWithText:(NSString *)text fontName:(NSString *)fontName fontColor:(SKColor *)color fontSize:(int)fontSize atPosition:(CGPoint)position withOnTouchAction:(void(^)(void))onTouchAction
{
    self = [self initWithText:text fontName:fontName fontColor:color fontSize:fontSize atPosition:position withHorizontalFontAlignment:SKLabelHorizontalAlignmentModeCenter andVerticalAlignment:SKLabelVerticalAlignmentModeBaseline withOnTouchAction:onTouchAction];
    
    return self;
}

- (id)initWithText:(NSString *)text fontName:(NSString *)fontName fontColor:(SKColor *)color fontSize:(int)fontSize atPosition:(CGPoint)position withHorizontalFontAlignment:(SKLabelHorizontalAlignmentMode)horizontalAlignment andVerticalAlignment:(SKLabelVerticalAlignmentMode)verticalAlignment withOnTouchAction:(void(^)(void))onTouchAction
{
    if (self = [super init])
    {
        self.label = [[SKLabelNode alloc] initWithFontNamed:fontName];
        self.label.color = color;
        self.originalColor = color;
        self.label.text = text;
        self.label.fontSize = fontSize;
        self.label.horizontalAlignmentMode = horizontalAlignment;
        self.label.verticalAlignmentMode = verticalAlignment;
        self.position = position;
        self.onTouch = onTouchAction;
        [self addChild:self.label];
        [self setUserInteractionEnabled:YES];
    }
    
    return self;
}


- (void)setText:(NSString *)text
{
    self.label.text = text;
}

- (void)setFontColor:(SKColor *)fontColor
{
    self.label.color = fontColor;
    self.originalColor = fontColor;
}

- (void)setOnTouchAction:(void(^)(void))onTouchAction
{
    self.onTouch = onTouchAction;
}

- (void)setEnabled:(BOOL)isEnabled
{
    [self setUserInteractionEnabled:isEnabled];
    self.isEnabled = isEnabled;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    __weak __typeof(&*self)weakSelf = self;
    
    [self runAction:[SKAction fadeAlphaTo:0.5 duration:0.2] completion:
     ^{
        [weakSelf runAction:[SKAction fadeAlphaTo:1 duration:0.2] completion:
         ^{
            if (weakSelf.onTouch)
                weakSelf.onTouch();
        }];
    }];
}

@end
