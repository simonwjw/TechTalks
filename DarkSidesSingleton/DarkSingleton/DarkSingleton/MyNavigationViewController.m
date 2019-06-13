//
//  MyNavigationViewController.m
//  DarkSingleton
//
//  Created by Simon Wang on 13/06/19.
//  Copyright © 2019 Simon Wang. All rights reserved.
//

#import "MyNavigationViewController.h"
#import "CoreDataManager.h"

@interface MyNavigationViewController ()

@end

@implementation MyNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
        [CoreDataManager.sharedInstance saveSomeData];
    });
}

@end
