//
//  iBraidViewController.m
//  iBraid
//
//  Created by alex rothenberg on 4/4/10.
//  Copyright Alex Rothenberg 2010. All rights reserved.
//

#import "LeftOverCenterStroke.h"
#import "RightOverCenterStroke.h"
#import "LeftOverCenterToBottomStroke.h"
#import "RightOverCenterToBottomStroke.h"


#import "iBraidViewController.h"



@implementation iBraidViewController

@synthesize strokes;

@synthesize leftColor;
@synthesize centerColor;
@synthesize rightColor;
@synthesize top;


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
	top = -60;
  leftColor   = [UIColor greenColor ];
  centerColor = [UIColor blueColor  ];
  rightColor  = [UIColor redColor   ];
  
  strokes = [[NSMutableArray alloc] init];
  
  [strokes addObject: [[RightOverCenterStroke alloc] initWithRect:self.bounds] ];
  [strokes addObject: [[LeftOverCenterStroke alloc] initWithRect:self.bounds] ];
  [strokes addObject: [[RightOverCenterStroke alloc] initWithRect:self.bounds] ];
  [strokes addObject: [[LeftOverCenterStroke alloc] initWithRect:self.bounds] ];
  [strokes addObject: [[RightOverCenterStroke alloc] initWithRect:self.bounds] ];
  [strokes addObject: [[LeftOverCenterStroke alloc] initWithRect:self.bounds] ];
  [strokes addObject: [[RightOverCenterStroke alloc] initWithRect:self.bounds] ];
  [strokes addObject: [[LeftOverCenterStroke alloc] initWithRect:self.bounds] ];
	[strokes addObject: [[RightOverCenterToBottomStroke alloc] initWithRect:self.bounds] ];
    }

  return self;
}


- (void)drawRect:(CGRect)rect
{
	NSLog(@"in move me DRAW");
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	//
	// Draw the background as a white square framed in black
	//
	//  CGRect cgBounds = self.bounds;
	//	CGRect cgBounds = NSRectToCGRect(nsBounds);
	CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
	CGContextFillRect(context, self.bounds);
	//	CGContextSetRGBFillColor(context, 0, 0, 0, 1.0);
	//	CGContextSetLineWidth(context, 1.0);
	//	CGContextStrokeRect(context, cgBounds);
	
  //	int strandWidth = 30;
  //	int sideSpace = (self.bounds.size.width - 3*strandWidth)/2;
	
	NSLog(@"before loop");
  int top = -60;
	for(id element in strokes) {
  	NSLog(@"in loop");

    [element drawStroke: top leftColor:[UIColor redColor] centerColor:[UIColor greenColor]  rightColor:[UIColor blueColor]];
    top += 30;
   	NSLog(@"in loop222");
  }
		
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
