//
//  MRVideoRenderView.m
//  FFmpeg009
//
//  Created by Matt Reach on 2019/1/28.
//  Copyright © 2019 Awesome FFmpeg Study Demo. All rights reserved.
//

#import "MRVideoRenderView.h"
#import <AVFoundation/AVSampleBufferDisplayLayer.h>

@implementation MRVideoRenderView

+ (Class)layerClass
{
    return [AVSampleBufferDisplayLayer class];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.layer.opaque = YES;
        [self setContentMode:UIViewContentModeScaleToFill];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.opaque = YES;
        [self setContentMode:UIViewContentModeScaleToFill];
    }
    return self;
}

- (void)setContentMode:(UIViewContentMode)contentMode
{
    switch (contentMode) {
        case UIViewContentModeScaleAspectFill:
        {
            AVSampleBufferDisplayLayer *layer = (AVSampleBufferDisplayLayer *)[self layer];
            layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        }
            break;
        case UIViewContentModeScaleAspectFit:
        {
            AVSampleBufferDisplayLayer *layer = (AVSampleBufferDisplayLayer *)[self layer];
            layer.videoGravity = AVLayerVideoGravityResizeAspect;
        }
            break;
        default:
        {
            AVSampleBufferDisplayLayer *layer = (AVSampleBufferDisplayLayer *)[self layer];
            layer.videoGravity = AVLayerVideoGravityResize;
        }
            break;
    }
}

- (UIViewContentMode)contentMode
{
    AVSampleBufferDisplayLayer *layer = (AVSampleBufferDisplayLayer *)[self layer];
    
    if ([AVLayerVideoGravityResizeAspect isEqualToString:layer.videoGravity]) {
        return UIViewContentModeScaleAspectFit;
    } else if ([AVLayerVideoGravityResizeAspectFill isEqualToString:layer.videoGravity]){
        return UIViewContentModeScaleAspectFill;
    } else {
        return UIViewContentModeScaleToFill;
    }
}

- (void)enqueueSampleBuffer:(CMSampleBufferRef)buffer
{
    AVSampleBufferDisplayLayer *layer = (AVSampleBufferDisplayLayer *)[self layer];
    [layer enqueueSampleBuffer:buffer];
}

- (void)cleanScreen
{
    AVSampleBufferDisplayLayer *layer = (AVSampleBufferDisplayLayer *)[self layer];
    [layer flushAndRemoveImage];
}

@end
