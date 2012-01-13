//
//  iBraidView.h
//  iBraid
//
//  Created by alex rothenberg on 4/4/10.
//  Copyright Alex Rothenberg 2010. All rights reserved.
//

#import "IBraidView.h"

#import "LeftOverCenterStroke.h"
#import "RightOverCenterStroke.h"
#import "LeftOverCenterToBottomStroke.h"
#import "RightOverCenterToBottomStroke.h"


// Import QuartzCore for animations
#import <QuartzCore/QuartzCore.h>


@implementation IBraidView

@synthesize leftColor;
@synthesize centerColor;
@synthesize rightColor;
@synthesize braiding;

@synthesize strokes;

/*
 If the view is stored in the nib file, when it's unarchived it's sent -initWithCoder:.
 This is the case in the example as provided.  See also initWithFrame:.
*/
- (id)initWithCoder:(NSCoder *)coder {
	
	if (self = [super initWithCoder:coder]) {
		[self setUpPlacardViews];
	}
	return self;
}

/*
 If you were to create the view programmatically, you would use initWithFrame:.
 You want to make sure the placard view is set up in this case as well (as in initWithCoder:).
 */
- (id)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		[self setUpPlacardViews];
	}
	return self;
}


- (void)setUpPlacardViews {

  leftColor   = [UIColor greenColor ];
  centerColor = [UIColor blueColor  ];
  rightColor  = [UIColor redColor   ];
  
  strokes = [[NSMutableArray alloc] init];
  
  [strokes addObject: [[RightOverCenterStroke alloc] initWithRect:self.bounds] ];
  [strokes addObject: [[LeftOverCenterStroke alloc] initWithRect:self.bounds] ];
  [strokes addObject: [[RightOverCenterStroke alloc] initWithRect:self.bounds] ];
  [strokes addObject: [[LeftOverCenterToBottomStroke alloc] initWithRect:self.bounds] ];
}


- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	//
	// Draw the background as a white square framed in black
	//
	CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
	CGContextFillRect(context, self.bounds);
	
  int top = -60;
  NSArray* colors =  [[NSArray alloc] initWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor blueColor], nil];

	for(id element in strokes) {
    colors = [element drawStroke: top leftColor:[colors objectAtIndex:0] centerColor:[colors objectAtIndex:1]  rightColor:[colors objectAtIndex:2]];
    top += 30;
  }
	
}





- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:self];

  self.braiding = [ [strokes lastObject] touchAtLocation: location];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  if (braiding) {
		
		UITouch *touch = [touches anyObject];
		CGPoint location = [touch locationInView:self];

    Stroke *stroke = (Stroke*)[strokes lastObject];
    stroke.x = location.x;
		
		[self setNeedsDisplay];
	}

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  if (braiding) {
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    Stroke *stroke = (Stroke*)[strokes lastObject];
    
    if ([stroke touchUpAtLocation: location]) {
      NSArray* nextStrokes = [stroke nextStrokes];
      [strokes removeLastObject];
      [strokes addObjectsFromArray: nextStrokes];      
    }
    [self setNeedsDisplay];
  }
  self.braiding = NO;
}

//- (bool)inStrand: (int)strandIdx loc:(CGPoint*)location
//{
//	NSLog(@"in inStrand?");
//	
//	bool after_left   = ((*location).x-bottomPoints[strandIdx].x) > 0;
//	bool before_right = ((*location).x-bottomPoints[strandIdx].x) < 30;
//	
//	
//	return after_left && before_right;
//}

- (void)dealloc {
	[super dealloc];	
}

@end
