//
//  VideoViewController.h
//  CameraMacOCII
//
//  Created by lakeem muhammad on 1/23/18.
//  Copyright © 2018 lakeem muhammad. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVfoundation/AVFoundation.h>
#import "CustomView.h"


@interface VideoViewController : NSViewController {
    AVCaptureSession *session;
    AVCaptureConnection *videoConnection;
    AVCaptureStillImageOutput *stillImageOutput;
}


@property (nonatomic, retain) CustomView *customView1;
@property (nonatomic, retain) AVCaptureVideoPreviewLayer *previewLayer;

@property(nonatomic, retain) IBOutlet NSButton *startPreviewButton;
@property(nonatomic, retain) IBOutlet NSButton *stopPreviewButton;
@property(nonatomic, retain) IBOutlet NSButton *takePictureButton;
@property(nonatomic, retain) IBOutlet NSImageView *imageView1;

-(void) initCatpureSession;
-(void) setupPreviewLayer;


-(IBAction) startPreviewClick :(id) sender;
-(IBAction) stopPreviewClick :(id) sender;
-(IBAction) takePictureClick :(id) sender;

@end
