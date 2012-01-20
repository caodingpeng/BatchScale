//
//  AppDelegate.h
//  BatchScale
//
//  Created by Dingpeng Cao on 16/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DropImageView.h"
#import "PreferenceController.h"
@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    PreferenceController *preferenceController_;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet DropImageView *imageView;
@property (assign) IBOutlet NSMenuItem *preferences;
@end
