//
//  ViewController.m
//  Fraction_Calculator
//
//  Created by 宋志豪 on 15/3/29.
//  Copyright (c) 2015年 novice. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@implementation ViewController{
    char                op;
    int                 currentNumber;
    BOOL                firstOperand, isNumber;
    Calculator          *myCalculator;
    NSMutableString     *displayString;
}

@synthesize display;


- (void)viewDidLoad {
    
    firstOperand = YES;
    isNumber = YES;
    
    displayString = [NSMutableString stringWithCapacity: 40];
    myCalculator = [[Calculator alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) processDigit:(int)digit{
    currentNumber = currentNumber * 10 + digit;
    [displayString appendString:[NSString stringWithFormat:@"%i", digit]];
    display.text = displayString;
}

-(IBAction)clickDigit:(UIButton *)sender{
    int digit = sender.tag;
    [self processDigit:digit];
}

-(void) processOp:(char)theOp{
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
            
        case '*':
            opStr = @" * ";
            break;
            
        case '/':
            opStr = @" / ";
            break;
    }
    
    [self storeFracPart];
    
    firstOperand = NO;
    isNumber = YES;
    
    [displayString appendString:opStr];
    
    display.text = displayString;
}

-(void) storeFracPart {
    if (firstOperand) {
        if (isNumber) {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }else{
            myCalculator.operand1.denominator = currentNumber;
        }
    }else if (isNumber){
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    }
    
    else{
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    
    currentNumber = 0;
}

-(IBAction)clickOver{
    [self storeFracPart];
    isNumber = NO;
    
    [displayString appendString:@"/"];
    
    display.text = displayString;
}

-(IBAction)clickPlus{
    [self processOp:'+'];
}

-(IBAction)clickMinus{
    [self processOp:'-'];
}

-(IBAction)clickMultiply{
    [self processOp:'*'];
}

-(IBAction)clickDivide{
    [self processOp:'/'];
}

-(IBAction)clickEquals{
    if (firstOperand == NO) {
        [self storeFracPart];
        [myCalculator performOperation:op];
        
        [displayString appendString:@" = "];
        [displayString appendString:[myCalculator.accumulator convertToString]];
        
        display.text = displayString;
        
        currentNumber = 0;
        
        isNumber = YES;
        firstOperand = YES;
        
        [displayString setString:@""];
    }
}

-(IBAction)clickClear{
    isNumber = YES;
    firstOperand = YES;
    
    currentNumber = 0;
    
    [myCalculator clear];
    [displayString setString:@""];
    display.text = displayString;
    
}

@end
