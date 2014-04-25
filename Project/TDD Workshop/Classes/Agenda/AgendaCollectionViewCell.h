//
//  TDD Workshop
//
//  Created by Lukasz Warchol on 22/04/14.
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface AgendaCollectionViewCell : UICollectionViewCell
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *startDateLabel;
@property(nonatomic, strong) UILabel *durationLabel;
@property(nonatomic, strong) UIView *typeView;
@property(nonatomic, strong) UILabel *speakersLabel;

@end
