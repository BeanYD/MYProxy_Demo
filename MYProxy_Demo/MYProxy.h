//
//  MYProxy.h
//  MYProxy_Demo
//
//  Created by dingbinbin on 2018/7/19.
//  Copyright © 2018年 dingbinbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYProxy : NSObject

+ (id)proxyWithTarget:(id)target;

@property (nonatomic, weak) id target;

@end
