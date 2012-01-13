//
//  iBraidView.h
//  iBraid
//
//  Created by alex rothenberg on 4/4/10.
//  Copyright Alex Rothenberg 2010. All rights reserved.
//

@interface IBraidView : UIView {
	UIColor *leftColor;
	UIColor *centerColor;
	UIColor *rightColor;
  NSMutableArray *strokes;
  BOOL    braiding;

	
}

@property (nonatomic, retain) NSMutableArray *strokes;
@property (nonatomic, retain) UIColor *leftColor;
@property (nonatomic, retain) UIColor *centerColor;
@property (nonatomic, retain) UIColor *rightColor;
@property (readwrite) BOOL braiding;

- (void)setUpPlacardViews;

@end

