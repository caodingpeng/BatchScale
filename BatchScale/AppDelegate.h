//
//  AppDelegate.h
//  BatchScale
//
//  Created by Dingpeng Cao on 16/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DropImageView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet DropImageView *imageView;

@end
