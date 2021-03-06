//
//  MRVideoFrame.h
//  FFmpeg005
//
//  Created by Matt Reach on 2017/10/20.
//  Copyright © 2018年 Awesome FFmpeg Study Demo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <libavutil/frame.h>
#import <UIKit/UIImage.h>
#import <CoreImage/CIImage.h>


@interface MRVideoFrame : NSObject

@property (assign, nonatomic) AVFrame *video_frame;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) CIImage *ciImage;
@property (assign, nonatomic) float duration;
@property (assign, nonatomic) BOOL eof;

@end
