//
//  ViewController.m
//  GGWebView
//
//  Created by __无邪_ on 15/9/18.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "TestJSObject.h"

@interface ViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSURL *url = [NSURL URLWithString:@"http://121.201.63.217:8080/api/0200/video/player.do?vid=XMTMzNzc2OTIwOA=="];
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    [self.webView setDelegate:self];
    [self.view addSubview:self.webView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //NSLog(@"%s %@ %ld",__func__,request,navigationType);
    //retrun YES 表示正常加载网页 返回NO 将停止网页加载
    
    //此url解析规则自己定义
    NSString* rurl=[[request URL] absoluteString];
    NSLog(@"RURL : %@",rurl);
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"%s",__func__);
    
//    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//    NSString *alertJS=@"alert('Hello , Baby !')"; //准备执行的js代码
//    [context evaluateScript:alertJS];//通过oc方法调用js的alert

}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"%s",__func__);
    
//    NSString *currentURL = [webView stringByEvaluatingJavaScriptFromString:@"document.location.href"];
//    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
//    NSLog(@"\n%@\n%@",currentURL,title);
    
    //首先创建JSContext 对象（此处通过当前webView的键获取到jscontext）
    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    TestJSObject *testJO=[TestJSObject new];
    context[@"testobject"]=testJO;

//    alert('Hello , Baby !');
    NSString *alertJS=@"alert('Hello , Baby !');testobject.TestNOParameter()"; //准备执行的js代码
    [context evaluateScript:alertJS];//通过oc方法调用js的alert
    
    //获得body与body之间的HTML
    NSString *allHTML = [webView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"];
    NSLog(@"allHTML: %@", allHTML);
    
    //通过name(获得/设置)页面元素的value值
//    NSString *js_email_ByName = [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByName('email')[0].value='hello';"];
//    NSLog(@"Name : %@",js_email_ByName);
    
    //通过id(获得/设置)页面元素的value值
//    NSString *js_email_ById = [webView stringByEvaluatingJavaScriptFromString:@"document.getElementByIdx_x_x('_iphone_email').value='asdfasdf';"];
//    NSLog(@"js_email_ById==%@",js_email_ById);
    
    
    
    //js调用iOS
    //第一种情况
    //其中test1就是js的方法名称，赋给是一个block 里面是iOS代码
    //此方法最终将打印出所有接收到的参数，js参数是不固定的 我们测试一下就知道
//    context[@"test1"] = ^() {
//        NSArray *args = [JSContext currentArguments];
//        for (id obj in args) {
//            NSLog(@"%@",obj);
//        }
//    };
//    //此处我们没有写后台（但是前面我们已经知道iOS是可以调用js的，我们模拟一下）
//    //首先准备一下js代码，来调用js的函数test1 然后执行
//    //一个参数
//    NSString *jsFunctStr=@"test1('参数1')";
//    [context evaluateScript:jsFunctStr];
//    
//    //二个参数
//    NSString *jsFunctStr1=@"test1('参数a','参数b')";
//    [context evaluateScript:jsFunctStr1];
    
    
    
    
    //第二种情况，js是通过对象调用的，我们假设js里面有一个对象 testobject 在调用方法
    //首先创建我们新建类的对象，将他赋值给js的对象
    
//    TestJSObject *testJO=[TestJSObject new];
//    context[@"testobject"]=testJO;
    
//    //同样我们也用刚才的方式模拟一下js调用方法
//    NSString *jsStr1=@"testobject.TestNOParameter()";
//    [context evaluateScript:jsStr1];
//    NSString *jsStr2=@"testobject.TestOneParameter('参数1')";
//    [context evaluateScript:jsStr2];
//    NSString *jsStr3=@"testobject.TestTowParameterSecondParameter('参数A','参数B')";
//    [context evaluateScript:jsStr3];
    
    
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    NSLog(@"ERROR : %s  %@",__func__,error);
    
}


@end
