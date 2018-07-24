//
//  RYProxy.m
//  MYProxy_Demo
//
//  Created by dingbinbin on 2018/7/19.
//  Copyright © 2018年 dingbinbin. All rights reserved.
//

#import "RYProxy.h"

@implementation RYProxy

+ (id)proxyWithTarget:(id)target {
    
    // NSProxy不需要进行init操作，本身无init方法
    RYProxy *proxy = [RYProxy alloc];
    proxy.target = target;
    
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [self.target forwardInvocation:invocation];
}

@end
