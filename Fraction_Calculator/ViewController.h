//
//  ViewController.h
//  Fraction_Calculator
//
//  Created by 宋志豪 on 15/3/29.
//  Copyright (c) 2015年 novice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong,nonatomic) IBOutlet UILabel *display;

-(void) processDigit : (int) digit;
-(void) processOp : (char) theOp;
-(void) storeFracPart;

-(IBAction) clickDigit : (UIButton *) sender;

-(IBAction) clickPlus;
-(IBAction) clickMinus;
-(IBAction) clickMultiply;
-(IBAction) clickDivide;

-(IBAction) clickOver;
-(IBAction) clickEquals;
-(IBAction) clickClear;

@end

