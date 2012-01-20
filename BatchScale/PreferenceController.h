//
//  PreferenceController.h
//  BatchScale
//
//  Created by Dingpeng Cao on 19/01/2012.
//  Copyright (c) 2012 zynga. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PreferenceController : NSWindowController
{
    IBOutlet NSView *_generalView;
    IBOutlet NSTextField *_scaleFactorField;
    IBOutlet NSStepperCell *_stepper;
}
-(NSRect)newFrameForNewContentView:(NSView *)view;
@end
