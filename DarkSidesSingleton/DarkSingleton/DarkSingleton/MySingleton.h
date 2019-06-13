//
//  MySingleton.h
//  DarkSingleton
//
//  Created by Simon Wang on 12/06/19.
//  Copyright © 2019 Simon Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MySingleton : NSObject

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
