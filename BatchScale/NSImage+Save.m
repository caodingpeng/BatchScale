//
//  NSImage+Save.m
//  BatchScale
//
//  Created by Dingpeng Cao on 16/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSImage+Save.h"

@implementation NSImage(saveWithName)
-(NSImage *)scaleImage:(NSSize)scaledSize
{
    NSImage *resizedImage=[[NSImage alloc] initWithSize:scaledSize];
    
    [resizedImage lockFocus];
    [self drawInRect:NSMakeRect(0, 0, scaledSize.width, scaledSize.height) fromRect:NSMakeRect(0, 0, self.size.width, self.size.height) operation:NSCompositeSourceOver fraction:1.0];
    [resizedImage unlockFocus];
    
    return [resizedImage autorelease];
}
-(void)saveWithName:(NSString *)fileName fileType:(NSBitmapImageFileType)fileType
{
    // Cache the reduced image
    NSData *imageData = [self TIFFRepresentation];
    NSBitmapImageRep *imageRep = [NSBitmapImageRep imageRepWithData:imageData];
    NSDictionary *imageProps = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:1.0] forKey:NSImageCompressionFactor];
    imageData = [imageRep representationUsingType:fileType properties:imageProps];
    [imageData writeToFile:fileName atomically:NO]; 
}
@end
