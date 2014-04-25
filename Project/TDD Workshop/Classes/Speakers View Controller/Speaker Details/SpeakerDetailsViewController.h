/*
 * Copyright 2014 Taptera Inc. All rights reserved.
 */


#import <Foundation/Foundation.h>

@class Speaker;


@interface SpeakerDetailsViewController : UIViewController
@property(nonatomic, readonly) Speaker *speaker;

- (instancetype)initWithSpeaker:(Speaker *)speaker;

@end
