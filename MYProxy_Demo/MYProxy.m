//
//  MYProxy.m
//  MYProxy_Demo
//
//  Created by dingbinbin on 2018/7/19.
//  Copyright © 2018年 dingbinbin. All rights reserved.
//

#import "MYProxy.h"

@implementation MYProxy

+ (id)proxyWithTarget:(id)target {
    MYProxy *proxy = [[MYProxy alloc] init];
    
    proxy.target = target;
    
    return proxy;
}

// 使用消息转发机制，调用target中对应的方法
- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    return self.target;
}

@end
