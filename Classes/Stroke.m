#import "Stroke.h"
// Import QuartzCore for animations
#import <QuartzCore/QuartzCore.h>


@implementation Stroke

@synthesize bounds;
@synthesize x;


/*
 If you were to create the view programmatically, you would use initWithFrame:.
 You want to make sure the placard view is set up in this case as well (as in initWithCoder:).
 */
- (id)initWithRect:(CGRect)frame {
  if (self = [super init]) {
    self.bounds = frame;
  }
  return self;
}

- (int) sideSpace
{
	int strandWidth = 30;
	int sideSpace = (self.bounds.size.width - 3*strandWidth)/2;
	return sideSpace;
}

- (int) left
{
	int strandWidth = 30;
	return (0.5*strandWidth + [self sideSpace]);
}
- (int) center 
{
	int strandWidth = 30;
	return (1.5*strandWidth + [self sideSpace]);
}
- (int) right 
{
	int strandWidth = 30;
	return (2.5*strandWidth + [self sideSpace]);
}


- (void)drawStrand:(CGPoint*)controlPoint1 pt2:(CGPoint*)controlPoint2  pt3:(CGPoint*)controlPoint3  pt4:(CGPoint*)controlPoint4 color:(UIColor*)strand_color
{
  CGContextRef context = UIGraphicsGetCurrentContext();

  //
  // Draw the background as a white square framed in black
  //
  CGRect cgBounds = self.bounds;

  [UIColor clearColor];
  //      self.opaque = NO;
  //      CGRect cgBounds = NSRectToCGRect(nsBounds);
  // self.opaque = NO;
  CGContextSetFillColorWithColor (context, [[UIColor clearColor] CGColor]);
  CGContextFillRect(context, self.bounds);

  //
  // Move to point zero and add the CurveToPoint
  //
  CGContextMoveToPoint(context, (*controlPoint1).x, (*controlPoint1).y);
  CGContextAddCurveToPoint(context,
                           (*controlPoint2).x, (*controlPoint2).y,
                           (*controlPoint3).x, (*controlPoint3).y,
                           (*controlPoint4).x, (*controlPoint4).y
                         );

  //
  // Now that we have added the drawing primitive to the current context's
  // path, we can draw it with a thick black stroke
  //
  CGContextSetLineWidth(context, 30.0);
  CGContextSetStrokeColorWithColor(context, strand_color.CGColor);
  CGContextStrokePath(context);

  if (NO) {
    [self drawControlPoint:controlPoint1 ctxt:context];
    [self drawControlPoint:controlPoint2 ctxt:context];
    [self drawControlPoint:controlPoint3 ctxt:context];
    [self drawControlPoint:controlPoint4 ctxt:context];
  }
  
}


- (void)drawControlPoint:(CGPoint*)controlPoint ctxt:(CGContextRef) context
{
  CGRect cgControlPointRect = [self controlPointRectForPoint:controlPoint];
  CGContextSetRGBFillColor(context, 0.5, 0.5, 0.5, 1.0);
  CGContextFillRect(context, cgControlPointRect);
  CGContextSetLineWidth(context, 1.0);
  CGContextStrokeRect(context, cgControlPointRect);
}

- (CGRect)controlPointRectForPoint:(CGPoint*)currentPoint
{
	const float CONTROL_POINT_SIZE = 8.0;
	
	CGRect controlPointRect =
	CGRectMake(
			   (*currentPoint).x - 0.5 * CONTROL_POINT_SIZE,
			   (*currentPoint).y - 0.5 * CONTROL_POINT_SIZE,
			   CONTROL_POINT_SIZE,
			   CONTROL_POINT_SIZE);
	
	return controlPointRect;
}
@end
