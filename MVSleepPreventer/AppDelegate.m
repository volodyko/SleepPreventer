//
//  AppDelegate.m
//  MVSleepPreventer
//
//  Created by Volodimir Moskaliuk on 8/17/17.
//  Copyright © 2017 Volodimir Moskaliuk. All rights reserved.
//

#import "AppDelegate.h"
#import "MVSleepPreventer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
	[[MVSleepPreventer sharedPreventer] aquireSleepLock];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
	[[MVSleepPreventer sharedPreventer] releaseSleepLock];
}


@end
