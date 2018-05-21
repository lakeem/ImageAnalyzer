//
//  VideoViewController.m
//  CameraMacOCII
//
//  Created by lakeem muhammad on 1/23/18.
//  Copyright © 2018 lakeem muhammad. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

-(void) viewWillAppear{
    
    [super viewDidLoad];
    [super viewWillAppear];
    self.customView1 = [[CustomView alloc] initWithFrame : self.view.bounds];
    [self.view setWantsLayer : YES];
    
    [self.view addSubview : self.customView1];
    [self initCatpureSession];
    [self setupPreviewLayer];
}

- (void)viewDidLoad {
}

-(void) initCatpureSession{
    
    session = [[AVCaptureSession alloc] init];
    
    if ([session canSetSessionPreset : AVCaptureSessionPresetHigh])
        [session setSessionPreset : AVCaptureSessionPresetHigh];
    
    AVCaptureDeviceInput *deviceInput = [[AVCaptureDeviceInput alloc] initWithDevice :
                                        [AVCaptureDevice devicesWithMediaType : AVMediaTypeVideo][0] error: nil];
    
    if([session canAddInput: deviceInput])
        [session addInput : deviceInput];
}


-(void) setupPreviewLayer {
    
     self.previewLayer =[[AVCaptureVideoPreviewLayer alloc] initWithSession : session ];
    
    [self.previewLayer setVideoGravity : AVLayerVideoGravityResizeAspectFill];
    
    [self.previewLayer setFrame : self.view.bounds];
    
    [self.view.layer addSublayer : self.previewLayer];
    //set up still image part
    stillImageOutput=[[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings =[[NSDictionary alloc] initWithObjectsAndKeys: AVVideoCodecJPEG, AVVideoCodecKey, nil];
    [stillImageOutput setOutputSettings : outputSettings];
    [session addOutput : stillImageOutput];
    
}

-(IBAction) startPreviewClick : (id) sender{
    if(![session isRunning])
        [session startRunning];
}
-(IBAction) stopPreviewClick : (id) sender{
    if([session isRunning])
        [session stopRunning];
}

//TODO: Add Historam when the UI is updated!!!!



-(IBAction) takePictureClick : (id) sender{
    
    videoConnection = nil;
    for(AVCaptureConnection *connection in stillImageOutput.connections){
        for(AVCaptureInputPort *port in [connection inputPorts]){
            if([[port mediaType] isEqual : AVMediaTypeVideo ])
                videoConnection= connection;
            break;
        }
        //if video connection is NOT nil then break!
        //TODO: Add proper error checking with the feature update
        if(videoConnection)
            break;
    }
    //Preview output. Leave this as an atomic operation.
    [stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef  _Nullable imageDataSampleBuffer, NSError * _Nullable error) {
        
        if(imageDataSampleBuffer !=nil){
            NSData *imageData=[AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
            
            NSImage *image= [[NSImage alloc] initWithData : imageData];
            
            self.imageView1.image = image;
        }
    }];
}
@end
