//
//  TestJSObject.m
//  GGWebView
//
//  Created by __无邪_ on 15/9/23.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "TestJSObject.h"
#import <UIKit/UIKit.h>

@implementation TestJSObject

//一下方法都是只是打了个log 等会看log 以及参数能对上就说明js调用了此处的iOS 原生方法
-(void)TestNOParameter
{
    NSLog(@"this is ios TestNOParameter");
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"ssf" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
    
}
-(void)TestOneParameter:(NSString *)message
{
    NSLog(@"this is ios TestOneParameter=%@",message);
}
-(void)TestTowParameter:(NSString *)message1 SecondParameter:(NSString *)message2
{
    NSLog(@"this is ios TestTowParameter=%@  Second=%@",message1,message2);
}
@end
