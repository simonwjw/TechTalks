//
//  ViewController.m
//  DarkSingleton
//
//  Created by Simon Wang on 12/06/19.
//  Copyright © 2019 Simon Wang. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataManager.h"
#import "BackgroundWorker.h"
#import <stdatomic.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (strong, nonatomic) BackgroundWorker *backgroundWorker;
@property (strong, nonatomic) dispatch_queue_t serialQueue;

@end

@implementation ViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _serialQueue = dispatch_queue_create("nz.mega.meetup", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

/* not thread safe lazy property
- (BackgroundWorker *)backgroundWorker {
    if (_backgroundWorker == nil) {
        _backgroundWorker = [[BackgroundWorker alloc] init];
    }
    
    return _backgroundWorker;
}
*/

/* thread safe implementation with mutex lock
- (BackgroundWorker *)backgroundWorker {
    @synchronized (self) {
        if (_backgroundWorker == nil) {
            _backgroundWorker = [[BackgroundWorker alloc] init];
        }
    }
    
    return _backgroundWorker;
}
*/

/* thread safe implementation with dispatch_sync
- (BackgroundWorker *)backgroundWorker {
    dispatch_sync(self.serialQueue, ^{
        if (self->_backgroundWorker == nil) {
            self->_backgroundWorker = [[BackgroundWorker alloc] init];
        }
    });
    
    return _backgroundWorker;
}
*/

// thread safe lazy property using double checked locking
- (BackgroundWorker *)backgroundWorker {
    BackgroundWorker *temp = _backgroundWorker;
    atomic_thread_fence(memory_order_acquire);
    if (temp == nil) {
        @synchronized (self) {
            temp = _backgroundWorker;
            if (temp == nil) {
                temp = [[BackgroundWorker alloc] init];
                atomic_thread_fence(memory_order_release);
                temp = _backgroundWorker;
            }
        }
    }
    
    return temp;
}


@end
