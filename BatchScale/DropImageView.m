//
//  DropImageView.m
//  BatchScale
//
//  Created by Dingpeng Cao on 16/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DropImageView.h"
#import "NSImage+Save.h"

@implementation DropImageView
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self=[super initWithCoder:aDecoder])) {
    }
    return self;
}

-(NSDragOperation )draggingEntered:(id<NSDraggingInfo>)sender
{
    BOOL findPngFiles=FALSE;
    
    NSArray *files = [[sender draggingPasteboard] propertyListForType:NSFilenamesPboardType];
    for (NSString *file in files) {
        if ([[file pathExtension] caseInsensitiveCompare:@"png"] == NSOrderedSame) {
            findPngFiles=TRUE;
        }
    }
    
    if (findPngFiles && ([sender draggingSourceOperationMask] & NSDragOperationCopy)) {
        _highLight=TRUE;
        [self setNeedsDisplay:TRUE];
        
        return NSDragOperationCopy;
    }
    return NSDragOperationNone;
}

-(BOOL)prepareForDragOperation:(id<NSDraggingInfo>)sender
{
    return TRUE;
}
-(BOOL)performDragOperation:(id<NSDraggingInfo>)sender
{
    _images = [[sender draggingPasteboard] propertyListForType:NSFilenamesPboardType];
    NSString *extension;
    for (NSString *file in _images) {
        extension=[file lastPathComponent];
        
        if ([extension rangeOfString:@"-hd."].location==NSNotFound && [extension rangeOfString:@"@2x."].location==NSNotFound) {
            continue;
        }
        
        NSImage *img=[[NSImage alloc] initWithContentsOfFile:file];
        [self setImage:img];
        [img release];
        [self display];
        
        //[self performSelectorInBackground:@selector(processImage:) withObject:file];
        [self processImage:file];
        sleep(0.5);
    }
    
    return TRUE;
}

-(void)concludeDragOperation:(id<NSDraggingInfo>)sender
{
    _highLight=FALSE;
    
    NSString *imageName = [[NSBundle mainBundle] pathForResource:@"DropFilesHere" ofType:@"png"];
    NSImage *img=[[NSImage alloc] initWithContentsOfFile: imageName];
    [self setImage:img];
    [img release];
    
    [self setNeedsDisplay:TRUE];
}
-(void)draggingExited:(id<NSDraggingInfo>)sender
{
    _highLight=NO;
    
    [self setNeedsDisplay:TRUE];
}

-(void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    if (_highLight) {
        [[NSColor greenColor] set];
        [NSBezierPath setDefaultLineWidth:5];
        [NSBezierPath strokeRect:dirtyRect];
    }
}

-(void)processImage:(NSString *)file
{
    //copy file
    NSString *fileName= [file lastPathComponent];
    NSString *targetFileName=[fileName stringByReplacingOccurrencesOfString:@"-hd" withString:@""];
    targetFileName=[targetFileName stringByReplacingOccurrencesOfString:@"@2x" withString:@""];
    NSString *targetPath=[file stringByReplacingOccurrencesOfString:[file lastPathComponent] withString:targetFileName];
    
    NSImage *targetImage=[[self image] scaleImage:NSMakeSize([self image].size.width*0.5, [self image].size.height*0.5)];
    [targetImage saveWithName:targetPath fileType:NSPNGFileType];
}
@end
