//
//  NSImage+Save.h
//  BatchScale
//
//  Created by Dingpeng Cao on 16/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSImage(saveWithName)
- (NSImage *)scaleImage:(NSSize)scaledSize;
- (void) saveWithName:(NSString*) fileName fileType:(NSBitmapImageFileType)fileType;
@end
