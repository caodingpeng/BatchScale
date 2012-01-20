//
//  AppDelegate.m
//  BatchScale
//
//  Created by Dingpeng Cao on 16/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize imageView = _imageView;
@synthesize preferences = _preferences;
- (void)dealloc
{
    [super dealloc];
}
	
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}
- (IBAction)showPreferences:(id)sender {
    if (preferenceController_) {
        [preferenceController_ release];
    }
    preferenceController_ =[[PreferenceController alloc] initWithWindowNibName:@"PreferenceWindow"];
    if (preferenceController_.window) {
        
    }
    [preferenceController_ showWindow:self];
}
@end
