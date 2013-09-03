//
//  UIButton+jump.m
//  XpressoApp
//
//  Created by V Veerabagu Subramanian on 12/08/13.
//
//

#import "UIButton+jump.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIButton (jump)


+ (CAKeyframeAnimation*)dockJumpAnimationWithViewHeight:(CGFloat)viewHeight
{
    NSUInteger const kNumFactors    = 50;
    CGFloat const kFactorsPerSec    = 30.0f;
    CGFloat const kFactorsMaxValue  = 128.0f;
    CGFloat factors[kNumFactors]    = {0,  60, 83, 100, 114, 124, 128, 128, 124, 114, 100, 83, 60, 32, 0, 0, 18, 28, 32, 28, 18, 0};
    
    NSMutableArray* transforms = [NSMutableArray array];
    
    for(NSUInteger i = 0; i < kNumFactors; i++)
    {
        CGFloat positionOffset  = factors[i] / kFactorsMaxValue * viewHeight;
        CATransform3D transform = CATransform3DMakeTranslation(0.0f, -positionOffset, 0.0f);
        
        [transforms addObject:[NSValue valueWithCATransform3D:transform]];
    }
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.repeatCount           = 3;
    animation.duration              = kNumFactors * 1.0f/kFactorsPerSec;
    animation.fillMode              = kCAFillModeForwards;
    animation.values                = transforms;
    animation.removedOnCompletion   = YES; // final stage is equal to starting stage
    animation.autoreverses          = NO;
    
    return animation;
}

- (void)jump:(float)jumpHowMuch
{
    CGFloat midHeight = self.frame.size.height * jumpHowMuch;
    CAKeyframeAnimation* animation = [[self class] dockJumpAnimationWithViewHeight:midHeight];
    [self.layer addAnimation:animation forKey:@"bouncing"];
}
@end
