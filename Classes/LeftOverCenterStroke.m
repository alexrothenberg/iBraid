#import "LeftOverCenterStroke.h"
// Import QuartzCore for animations
#import <QuartzCore/QuartzCore.h>

@implementation LeftOverCenterStroke

- (NSArray*)drawStroke:(int)top leftColor:(UIColor *)leftColor centerColor:(UIColor *)centerColor rightColor:(UIColor *)rightColor 
{
  CGPoint controlPoint1 = CGPointMake([self center]+1,      top+40-1+10     );
  CGPoint controlPoint2 = controlPoint1;
  CGPoint controlPoint3 = controlPoint1;
  CGPoint controlPoint4 = CGPointMake([self left ],         top+40 + 40);
  [self drawStrand:&controlPoint1 pt2:&controlPoint2 pt3:&controlPoint3 pt4:&controlPoint4 color:centerColor];

  controlPoint1 = CGPointMake([self left ]+1,    top+10-1+10   );
  controlPoint2 = CGPointMake([self left ] -10,  top+10 + 20);
  controlPoint3 = CGPointMake([self left ] -5,   top+10 + 35);
  controlPoint4 = CGPointMake([self center],     top+10 + 70);
  [self drawStrand:&controlPoint1 pt2:&controlPoint2 pt3:&controlPoint3 pt4:&controlPoint4 color:leftColor];

  return [[NSArray alloc] initWithObjects:centerColor, leftColor, rightColor, nil];
}

@end

