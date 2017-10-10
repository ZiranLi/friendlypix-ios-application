//
//  GradientLayer.m
//  FriendlyPix
//
//  Created by Ibrahim Ulukaya on 9/27/17.
//  Copyright © 2017 Google Inc. All rights reserved.
//

#import "GradientLayer.h"

@implementation GradientLayer
- (instancetype)init
{
  self = [super init];
  if (self) {
    [self setNeedsDisplay];
  }
  return self;
}

- (void)drawInContext:(CGContextRef)ctx
{

  size_t gradLocationsNum = 2;
  CGFloat gradLocations[2] = {0.0f, 1.0f};
  CGFloat gradColors[8] = {0.01f,0.61f,0.90f,1.0f, 0.0f,0.34f,0.61f,1.0f};
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
  CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, gradColors, gradLocations, gradLocationsNum);
  CGColorSpaceRelease(colorSpace);

  CGPoint gradCenter= CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
  float gradRadius = MIN(self.bounds.size.width , self.bounds.size.height) ;

  CGContextDrawRadialGradient (ctx, gradient, gradCenter, 0, gradCenter, gradRadius, kCGGradientDrawsAfterEndLocation);


  CGGradientRelease(gradient);
}
@end
