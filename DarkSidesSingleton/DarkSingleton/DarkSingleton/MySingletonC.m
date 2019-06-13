//
//  MySingletonC.m
//  DarkSingleton
//
//  Created by Simon Wang on 13/06/19.
//  Copyright © 2019 Simon Wang. All rights reserved.
//

#import "MySingletonC.h"
#import "MySingleton.h"
#import "MySingletonB.h"

@implementation MySingletonC

+ (instancetype)sharedInstance {
    static MySingletonC *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[MySingletonC alloc] init];
    });
    
    return shared;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        MySingletonB.sharedInstance.name = @"B";
    }
    return self;
}

@end
