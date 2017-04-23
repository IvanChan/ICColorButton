//
//  ICColorButton.m
//
//
//  Created by _ivanC on 3/18/14.
//  Copyright © 2015 _ivanC. All rights reserved.
//

#import "ICColorButton.h"
#import <QuartzCore/QuartzCore.h>

@interface ICColorButton ()

@property (nonatomic, strong) NSMutableDictionary *backgroundColorsForStates;
@property (nonatomic, strong) NSMutableDictionary *borderColorsForStates;
@property (nonatomic, strong) NSMutableDictionary *tintColorsForStates;

@end

@implementation ICColorButton

#pragma mark - Layout
- (void)layoutSubviews
{
    [super layoutSubviews];

    [self reloadBackgroundColor];
    [self reloadBorderColor];
    [self reloadTintColor];
}

- (void)reloadBackgroundColor
{
    UIColor *color = [self backgroundColorForState:self.state];
    if (color)
    {
        self.backgroundColor = color;
    }
}

- (void)reloadBorderColor
{
    UIColor *color = [self borderColorForState:self.state];
    if (color)
    {
         self.layer.borderColor = [color CGColor];
    }
}

- (void)reloadTintColor
{
    UIColor *color = [self tintColorForState:self.state];
    if (color)
    {
        self.tintColor = color;
    }
}

#pragma mark - Getters
- (NSMutableDictionary *)backgroundColorsForStates
{
    if (_backgroundColorsForStates == nil)
    {
        _backgroundColorsForStates = [[NSMutableDictionary alloc] initWithCapacity:3];
    }
    
    return _backgroundColorsForStates;
}

- (NSMutableDictionary *)borderColorsForStates
{
    if (_borderColorsForStates == nil)
    {
        _borderColorsForStates = [[NSMutableDictionary alloc] initWithCapacity:3];
    }
    
    return _borderColorsForStates;
}

- (NSMutableDictionary *)tintColorsForStates
{
    if (_tintColorsForStates == nil)
    {
        _tintColorsForStates = [[NSMutableDictionary alloc] initWithCapacity:3];
    }
    
    return _tintColorsForStates;
}

- (NSString *)keyForState:(UIControlState)state
{
    return [NSString stringWithFormat:@"%@", @(state)];
}

- (UIColor *)defaultColor
{
    return [UIColor clearColor];
}

#define BREAK_IF_EXIST(obj) if(obj){break;}
- (UIColor *)colorForState:(UIControlState)state inColorSet:(NSMutableDictionary *)colorSet
{
    UIColor *color = nil;
    
    do
    {
        // Check Current State
        NSString *key = [self keyForState:state];
        color = [colorSet objectForKey:key];
        BREAK_IF_EXIST(color);
        
        // Check Normal State
        key = [self keyForState:UIControlStateNormal];
        color = [colorSet objectForKey:key];
        BREAK_IF_EXIST(color);
        
        // Use Default
        color = [self defaultColor];
        
    } while (0);
    
    return color;
}

#pragma mark - Setters
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    if (backgroundColor == nil)
    {
        return;
    }
    
    NSString *key = [self keyForState:state];
    [self.backgroundColorsForStates setObject:backgroundColor forKey:key];
    
    [self reloadBackgroundColor];
}

- (UIColor *)backgroundColorForState:(UIControlState)state
{
    UIColor *color = [self colorForState:state inColorSet:self.backgroundColorsForStates];
    return color;
}

- (void)setBorderColor:(UIColor *)borderColor forState:(UIControlState)state
{
    if (borderColor == nil)
    {
        return;
    }
    
    NSString *key = [self keyForState:state];
    [self.borderColorsForStates setObject:borderColor forKey:key];
    
    [self reloadBorderColor];
}

- (UIColor *)borderColorForState:(UIControlState)state
{
    UIColor *color = [self colorForState:state inColorSet:self.borderColorsForStates];
    return color;
}

- (void)setTintColor:(UIColor *)tintColor forState:(UIControlState)state
{
    if (tintColor == nil)
    {
        return;
    }
    
    NSString *key = [self keyForState:state];
    [self.tintColorsForStates setObject:tintColor forKey:key];
    
    [self reloadBorderColor];
}

- (UIColor *)tintColorForState:(UIControlState)state
{
    UIColor *color = [self colorForState:state inColorSet:self.tintColorsForStates];
    return color;
}

@end
