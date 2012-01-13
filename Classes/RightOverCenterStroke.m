#import "RightOverCenterStroke.h"
// Import QuartzCore for animations
#import <QuartzCore/QuartzCore.h>

@implementation RightOverCenterStroke

- (NSArray*)drawStroke:(int)top leftColor:(UIColor *)leftColor centerColor:(UIColor *)centerColor rightColor:(UIColor *)rightColor 
{
	CGPoint controlPoint1 = CGPointMake([self center]-1,      top+40-1+10     );
  CGPoint controlPoint2 = controlPoint1;
  CGPoint controlPoint3 = controlPoint1;
	CGPoint controlPoint4 = CGPointMake([self right ],        top+40 + 40);
	[self drawStrand:&controlPoint1 pt2:&controlPoint2 pt3:&controlPoint3 pt4:&controlPoint4 color:centerColor];

	controlPoint1 = CGPointMake([self right ]-1,    top+10-1+10   );
	controlPoint2 = CGPointMake([self right ] +10,  top+10 + 20);
	controlPoint3 = CGPointMake([self right ] + 5,  top+10 + 35);
	controlPoint4 = CGPointMake([self center],      top+10 + 70);
	[self drawStrand:&controlPoint1 pt2:&controlPoint2 pt3:&controlPoint3 pt4:&controlPoint4 color:rightColor];
  
//  NSLog(@"RIGHT (%d, %d), (%d, %d), (%d, %d), (%d, %d)", 
//        controlPoint1.x, controlPoint1.y, 
//        controlPoint2.x, controlPoint2.y, 
//        controlPoint3.x, controlPoint3.y, 
//        controlPoint4.x, controlPoint4.y);
        
  return [[NSArray alloc] initWithObjects:leftColor, rightColor, centerColor, nil];
}

@end

