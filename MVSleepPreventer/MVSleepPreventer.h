//
//  MVSleepPreventer.h
//  MVSleepPreventer
//
//  Created by Volodimir Moskaliuk on 8/17/17.
//  Copyright © 2017 Volodimir Moskaliuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <IOKit/pwr_mgt/IOPMLib.h>

@interface MVSleepPreventer : NSObject

@property(nonatomic, assign, readonly, getter=isLockAquired) BOOL lockAquired;

+ (instancetype)sharedPreventer;

- (BOOL)releaseSleepLock;
- (BOOL)aquireSleepLock;

- (BOOL)releaseSleepLock:(IOPMAssertionID) assertionID;
- (BOOL)aquireSleepLock:(IOPMAssertionID) assertionID;

@end
