//
//  ViewController.m
//  MYProxy_Demo
//
//  Created by dingbinbin on 2018/7/19.
//  Copyright © 2018年 dingbinbin. All rights reserved.
//

#import "ViewController.h"
#import "MYProxy.h"
#import "RYProxy.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) CADisplayLink *link;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:[RYProxy proxyWithTarget:self] selector:@selector(timerAction) userInfo:nil repeats:YES];
    
    // 调用频率和屏幕刷新刷帧频率一致，60FPS
    self.link = [CADisplayLink displayLinkWithTarget:[RYProxy proxyWithTarget:self] selector:@selector(linkAction)];
    [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)timerAction {
    NSLog(@"%s", __func__);
}

- (void)linkAction {
    NSLog(@"%s", __func__);
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    
    // 停止定时器，否则controller释放之后，proxy无法找到该控制器中对应的方法，消息转发机制失效
    [self.timer invalidate];
    
    [self.link invalidate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}


@end
