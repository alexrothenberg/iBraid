#import "LeftOverCenterToBottomStroke.h"
#import "LeftOverCenterStroke.h"
#import "RightOverCenterToBottomStroke.h"

// Import QuartzCore for animations
#import <QuartzCore/QuartzCore.h>

@implementation LeftOverCenterToBottomStroke

- (id)initWithRect:(CGRect)frame {
  if (self = [super initWithRect:frame]) {
    self.x = [self right] + 100;
  }
  return self;
}


- (NSArray*)drawStroke:(int)top leftColor:(UIColor *)leftColor centerColor:(UIColor *)centerColor rightColor:(UIColor *)rightColor 
{
  CGPoint controlPoint1 = CGPointMake([self center]+1,      top+40-1+10);
  CGPoint controlPoint2 = controlPoint1; 
  CGPoint controlPoint3 = controlPoint1; 
  CGPoint controlPoint4 = CGPointMake([self left ] -60,     top+40 + 100);
  [self drawStrand:&controlPoint1 pt2:&controlPoint2 pt3:&controlPoint3 pt4:&controlPoint4 color:centerColor];
  
  int bottomOfCenter = [self center] + 70;
  controlPoint1 = CGPointMake([self left ]+1,               top+10-1+10   );
  controlPoint2 = CGPointMake([self left ] -15,             top+10 + 25);
  controlPoint3 = CGPointMake([self left ] - 5,             top    + 50);
  controlPoint4 = CGPointMake(bottomOfCenter,               top+50 + 100);
  [self drawStrand:&controlPoint1 pt2:&controlPoint2 pt3:&controlPoint3 pt4:&controlPoint4 color:leftColor];

  int controlPoint3StartX = [self right ] + 30;
  int controlPoint3EndX   = [self right ] + 5;
  int controlPoint3CurrentX;
  if (x > controlPoint3StartX)
    controlPoint3CurrentX = controlPoint3StartX;
  else if (x < controlPoint3EndX)
    controlPoint3CurrentX = controlPoint3EndX;
  else
    controlPoint3CurrentX = x;
  controlPoint1 = CGPointMake([self right ]-1,            top+40-1+10   );
  controlPoint2 = CGPointMake([self right ] +15,          top+40 + 25);
  controlPoint3 = CGPointMake(controlPoint3CurrentX,      top+40 + 40);
  controlPoint4 = CGPointMake(x,                          top+40 + 110);
  [self drawStrand:&controlPoint1 pt2:&controlPoint2 pt3:&controlPoint3 pt4:&controlPoint4 color:rightColor];
  
  return [[NSArray alloc] initWithObjects:centerColor, leftColor, rightColor, nil];
}

- (BOOL) touchAtLocation: (CGPoint)location
{
  int bottomOfRight = [self right] + 100;
  return (location.x > bottomOfRight-40) && (location.x < bottomOfRight+40);
}

- (BOOL) touchUpAtLocation: (CGPoint)location
{
  int bottomOfCenter = [self center] + 70;
  BOOL braidHappened = (x <=  bottomOfCenter);
  if (!braidHappened) {
    self.x = [self right] + 100;
  }
  return braidHappened;
}


- (NSArray*)nextStrokes
{
  NSMutableArray * strokes = [[NSMutableArray alloc] init];
  
  [strokes addObject: [[LeftOverCenterStroke alloc]          initWithRect:self.bounds] ];
	[strokes addObject: [[RightOverCenterToBottomStroke alloc] initWithRect:self.bounds] ];
  return strokes;
}

@end
