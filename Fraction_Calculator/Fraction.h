//
//  Fraction.h
//  Fraction_Calculator
//
//  Created by 宋志豪 on 15/3/29.
//  Copyright (c) 2015年 novice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Fraction : NSObject

@property int numerator, denominator;

-(void)         print;
-(void)         setTo : (int) n over : (int) d;
-(Fraction *)   add : (Fraction *) f;
-(Fraction *)   subtract : (Fraction *) f;
-(Fraction *)   multiply : (Fraction *) f;
-(Fraction *)   divide : (Fraction *) f;

-(void)         reduce;
-(double)       convertToNum;
-(NSString *)   convertToString;

@end
