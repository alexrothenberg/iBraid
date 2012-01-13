//
//  iBraidAppDelegate.h
//  iBraid
//
//  Created by alex rothenberg on 4/4/10.
//  Copyright Alex Rothenberg 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iBraidViewController;

@interface iBraidAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iBraidViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iBraidViewController *viewController;

@end

