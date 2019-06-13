//
//  MySingleton.m
//  DarkSingleton
//
//  Created by Simon Wang on 12/06/19.
//  Copyright © 2019 Simon Wang. All rights reserved.
//

#import "MySingleton.h"
#import <stdatomic.h>

@interface MySingleton ()

@end

@implementation MySingleton

/* not thread safe
 
+ (instancetype)sharedInstance {
    static MySingleton *shared = nil;
    if (shared == nil) {
        shared = [[MySingleton alloc] init];
    }

    return shared;
}
*/

/* thread safe implementation with mutex lock
 
+ (instancetype)sharedInstance {
    static MySingleton *shared = nil;
    @synchronized ([self class]) {
        if (shared == nil) {
            shared = [[MySingleton alloc] init];
        }
    }
    
    return shared;
}
*/

/* thread safe and stable double checked locking implementation with memory barriers
+ (instancetype)sharedInstance {
    static MySingleton *shared = nil;
    MySingleton *temp = shared;
    atomic_thread_fence(memory_order_acquire);
    if (temp == nil) {
        @synchronized ([self class]) {
            temp = shared;
            if (temp == nil) {
                temp = [[MySingleton alloc] init];
                atomic_thread_fence(memory_order_release);
                shared = temp;
            }
        }
    }
    
    return temp;
}
*/

// dispatch_once implementation
+ (instancetype)sharedInstance {
    static MySingleton *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[MySingleton alloc] init];
    });
    
    return shared;
}

@end
