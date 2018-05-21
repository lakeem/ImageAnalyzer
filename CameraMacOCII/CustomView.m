//
//  CustomView.m
//  CameraMacOCII
//
//  Created by lakeem muhammad on 1/23/18.
//  Copyright © 2018 lakeem muhammad. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    /*
     This sets up the CustomView object in the Preview pane.
     */
    
    //TODO:  Give the UI some TLC and refresh with upate
    CGContextRef context =[[NSGraphicsContext currentContext] graphicsPort];
    CGContextSetRGBFillColor(context, 0, 0, 0, 0.50); //black background with 50% Alpha value
    CGContextFillRect(context, NSRectToCGRect(dirtyRect));
    
    //border
    self.layer.borderColor=[[NSColor whiteColor] CGColor];
    self.layer.borderWidth = 2.0F;
    
}

@end
