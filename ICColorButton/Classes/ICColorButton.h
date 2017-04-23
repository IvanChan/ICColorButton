//
//  ICColorButton.h
//
//
//  Created by _ivanC on 3/18/14.
//  Copyright © 2015 _ivanC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICColorButton : UIButton

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;
- (UIColor *)backgroundColorForState:(UIControlState)state;

- (void)setBorderColor:(UIColor *)borderColor forState:(UIControlState)state;
- (UIColor *)borderColorForState:(UIControlState)state;

- (void)setTintColor:(UIColor *)tintColor forState:(UIControlState)state;
- (UIColor *)tintColorForState:(UIControlState)state;

@end
