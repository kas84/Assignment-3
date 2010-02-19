//
//  HelloPollyAppDelegate.m
//  HelloPolly
//
//  Created by Pablo Caselas Pedreira on 15/02/10.
//  Copyright ICEX 2010. All rights reserved.
//

#import "HelloPollyAppDelegate.h"

@implementation HelloPollyAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
