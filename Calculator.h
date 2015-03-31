//
//  Header.h
//  Fraction_Calculator
//
//  Created by 宋志豪 on 15/3/29.
//  Copyright (c) 2015年 novice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fraction.h"

@interface  Calculator : NSObject

@property (strong,nonatomic) Fraction *operand1;
@property (strong,nonatomic) Fraction *operand2;
@property (strong,nonatomic) Fraction *accumulator;

-(Fraction *) performOperation : (char) op;
-(void) clear;

@end