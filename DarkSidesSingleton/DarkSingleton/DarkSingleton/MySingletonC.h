//
//  MySingletonC.h
//  DarkSingleton
//
//  Created by Simon Wang on 13/06/19.
//  Copyright © 2019 Simon Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MySingletonC : NSObject

@property (copy, nonatomic) NSString *name;

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
