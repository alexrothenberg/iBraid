//
//  Stroke.h
//  iBraid
//
//  Created by alex rothenberg on 3/15/10.
//  Copyright 2010 Alex Rothenberg. All rights reserved.
//

@interface Stroke : NSObject {
  CGRect bounds;
  int x;
}
  
@property (readwrite,assign) int     x;
@property (nonatomic) CGRect bounds;

- (void)drawStrand:(CGPoint*)controlPoint1 pt2:(CGPoint*)controlPoint2  pt3:(CGPoint*)controlPoint3  pt4:(CGPoint*)controlPoint4 color:(UIColor*)strand_color;
- (void)drawControlPoint:(CGPoint*)controlPoint  ctxt:(CGContextRef) context;
- (CGRect)controlPointRectForPoint:(CGPoint*)currentPoint;

- (int) sideSpace;
- (int) left;
- (int) center;
- (int) right; 


@end
