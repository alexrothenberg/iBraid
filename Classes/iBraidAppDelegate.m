//
//  iBraidAppDelegate.m
//  iBraid
//
//  Created by alex rothenberg on 4/4/10.
//  Copyright Alex Rothenberg 2010. All rights reserved.
//

#import "iBraidAppDelegate.h"
#import "iBraidViewController.h"

@implementation iBraidAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	/*
   Set up a view controller to manage the IBraidView.
   Since the view controller has no custom behavior in this application, just use an instance of UIViewController.
   */
	UIViewController *aViewController = [[UIViewController alloc] initWithNibName:@"IBraidView" bundle:[NSBundle mainBundle]];
	self.viewController = aViewController;
	[aViewController release];
	
	// Add the view controller's view as a subview of the window
	UIView *controllersView = [viewController view];
	[window addSubview:controllersView];
	[window makeKeyAndVisible];
}


- (void)dealloc {
	[viewController release];
  [window release];
  [super dealloc];
}


@end
