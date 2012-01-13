//
//  iBraidViewController.h
//  iBraid
//
//  Created by alex rothenberg on 4/4/10.
//  Copyright mckinsey 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iBraidViewController : UIViewController {
	UIColor *leftColor;
	UIColor *centerColor;
	UIColor *rightColor;
	int     top;
  NSMutableArray *strokes;

}

@property (nonatomic, retain) NSMutableArray *strokes;
@property (nonatomic, retain) UIColor *leftColor;
@property (nonatomic, retain) UIColor *centerColor;
@property (nonatomic, retain) UIColor *rightColor;
@property (nonatomic) int     top;


@end

