//
//  MVSleepPreventer.m
//  MVSleepPreventer
//
//  Created by Volodimir Moskaliuk on 8/17/17.
//  Copyright © 2017 Volodimir Moskaliuk. All rights reserved.
//

#import "MVSleepPreventer.h"

#include <IOKit/pwr_mgt/IOPMLib.h>
#include <IOKit/IOMessage.h>

@interface MVSleepPreventer()

@property(nonatomic, assign) IOPMAssertionID assertionID;
@property(nonatomic, assign, readwrite) BOOL lockAquired;

@end

@implementation MVSleepPreventer

+ (instancetype)sharedPreventer
{
	static MVSleepPreventer *sharedRejector = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedRejector = [[self alloc] init];
	});
	return sharedRejector;
}

- (instancetype)init
{
	self = [super init];
	if(self != nil)
	{
		_lockAquired = NO;
	}
	return self;
}

- (BOOL)aquireSleepLock
{
	return [self aquireSleepLock:self.assertionID];
}

- (BOOL)aquireSleepLock:(IOPMAssertionID) assertionID
{
	CFStringRef reasonForActivity = CFSTR("MVSleepLock");
	
	IOReturn success = IOPMAssertionCreateWithName(kIOPMAssertionTypeNoDisplaySleep,
												   kIOPMAssertionLevelOn, reasonForActivity, &assertionID);
	if(success == kIOReturnSuccess)
	{
		NSLog(@"sleep: aquire success");
		self.lockAquired = YES;
	}
	return self.lockAquired;
}

- (BOOL)releaseSleepLock
{
	return [self releaseSleepLock:self.assertionID];
}

- (BOOL)releaseSleepLock:(IOPMAssertionID) assertionID
{
	IOReturn success = IOPMAssertionRelease(assertionID);
	if(success == kIOReturnSuccess)
	{
		NSLog(@"sleep: release success");
		self.lockAquired = NO;
	}
	return self.lockAquired;
}


@end
