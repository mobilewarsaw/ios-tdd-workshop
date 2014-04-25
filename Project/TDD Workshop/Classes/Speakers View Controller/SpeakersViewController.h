//
//  SpeakersViewController.h
//  TDD Workshop
//
//  Created by Pawel Dudek on 20/04/14.
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SpeakersCollectionViewDataSource;

@interface SpeakersViewController : UICollectionViewController <UINavigationControllerDelegate>
@property(nonatomic, strong) SpeakersCollectionViewDataSource *speakersDataSource;

@property(nonatomic, readonly) NSArray *speakers;
@end
