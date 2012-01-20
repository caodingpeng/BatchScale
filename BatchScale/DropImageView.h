//
//  DropImageView.h
//  BatchScale
//
//  Created by Dingpeng Cao on 16/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <AppKit/AppKit.h>
#import "NSImage+Save.h"
@interface DropImageView : NSImageView
{
    Boolean _highLight;
    NSArray *_images;
    
    CGFloat  _scaleFactor;
}
-(void)processImage:(NSString *)file;
@end
