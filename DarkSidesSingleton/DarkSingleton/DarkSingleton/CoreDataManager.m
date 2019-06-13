//
//  CoreDataManager.m
//  DarkSingleton
//
//  Created by Simon Wang on 13/06/19.
//  Copyright © 2019 Simon Wang. All rights reserved.
//

#import "CoreDataManager.h"
@import CoreData;

@interface CoreDataManager ()

@property (strong, nonatomic) NSPersistentContainer *persistentContainer;

@end

@implementation CoreDataManager

+ (instancetype)sharedInstance {
    static CoreDataManager *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[CoreDataManager alloc] init];
    });
    
    return shared;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _persistentContainer = [self buildPersistentContainer];
    }
    return self;
}

- (NSPersistentContainer *)buildPersistentContainer {
    NSPersistentContainer *container = [NSPersistentContainer persistentContainerWithName:@"MyModel"];
    [container loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription * _Nonnull storeDescription, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error when to create core data stack %@", error);
            abort();
        }
    }];
    
    return container;
}

- (void)saveSomeData {
    
}

- (NSString *)fetchAString {
    // fetch data...
    return @"hello world";
}

@end
