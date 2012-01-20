//
//  PreferenceController.m
//  BatchScale
//
//  Created by Dingpeng Cao on 19/01/2012.
//  Copyright (c) 2012 zynga. All rights reserved.
//

#import "PreferenceController.h"

@implementation PreferenceController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    self.window.title=@"Preference Panel";
    [[self.window contentView] addSubview:_generalView];
    [self.window center];
    
    [self.window setFrame:[self newFrameForNewContentView:_generalView] display:YES];
    
    //load preference
    CGFloat factor=[[NSUserDefaults standardUserDefaults] floatForKey:@"BatchScaleScaleFactor"];
    if (factor==0) {
        factor=0.5;
    }
    _scaleFactorField.stringValue=[NSString stringWithFormat:@"%.02f",factor];
    _stepper.integerValue=factor*100;
}
- (IBAction)switchView:(id)sender {
    
}
- (IBAction)stepClick:(id)sender {
    CGFloat factor=_stepper.intValue*0.01;
    
    _scaleFactorField.stringValue=[NSString stringWithFormat:@"%.02f",factor];
    
    [[NSUserDefaults standardUserDefaults] setFloat:factor forKey:@"BatchScaleScaleFactor"];
    NSLog(@"stepper value:%d",_stepper.intValue);
}

-(NSRect)newFrameForNewContentView:(NSView *)view {
	
    NSRect newFrameRect = [self.window frameRectForContentRect:[view frame]];
    NSRect oldFrameRect = [self.window frame];
    NSSize newSize = newFrameRect.size;
    NSSize oldSize = oldFrameRect.size;    
    NSRect frame = [self.window frame];
    frame.size = newSize;
    frame.origin.y -= (newSize.height - oldSize.height);
    
    return frame;
}

@end
