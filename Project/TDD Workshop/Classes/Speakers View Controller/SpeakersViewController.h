//
//  SpeakersViewController.h
//  TDD Workshop
//
//  Created by Pawel Dudek on 20/04/14.
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SpeakersCollectionViewDataSource;

@interface SpeakersViewController : UICollectionViewController

@property(nonatomic, strong) SpeakersCollectionViewDataSource *speakersDataSource;
@end
