//
//  MySingletonB.m
//  DarkSingleton
//
//  Created by Simon Wang on 13/06/19.
//  Copyright © 2019 Simon Wang. All rights reserved.
//

#import "MySingletonB.h"

@implementation MySingletonB

+ (instancetype)sharedInstance {
    static MySingletonB *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[MySingletonB alloc] init];
    });
    
    return shared;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        MySingletonC.sharedInstance.name = @"C";
    }
    return self;
}

@end
