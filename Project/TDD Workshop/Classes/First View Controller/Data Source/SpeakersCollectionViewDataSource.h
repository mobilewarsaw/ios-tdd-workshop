/*

 * Copyright 2014 Taptera Inc. All rights reserved.
 */


#import <Foundation/Foundation.h>


@interface SpeakersCollectionViewDataSource : NSObject  <UICollectionViewDataSource>
@property(nonatomic, readonly) NSArray *speakers;

- (instancetype)initWithSpeakers:(NSArray *)speakers;

@end
