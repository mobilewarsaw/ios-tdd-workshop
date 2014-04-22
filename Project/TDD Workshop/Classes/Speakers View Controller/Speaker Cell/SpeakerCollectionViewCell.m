/*
* Copyright 2014 Taptera Inc. All rights reserved.
*/


#import "SpeakerCollectionViewCell.h"


@implementation SpeakerCollectionViewCell
@synthesize nameLabel = _nameLabel;
@synthesize imageView = _imageView;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _nameLabel = [[UILabel alloc] init];
        [self.nameLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [self.contentView addSubview:self.nameLabel];

        _imageView = [[UIImageView alloc] init];
        self.imageView.image = [UIImage imageNamed:@"Contact"];

        [self.imageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.imageView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [[self contentView] addSubview:self.imageView];

        [self setupConstraints];
    }

    return self;
}

#pragma mark -

- (void)setupConstraints {
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *views = @{@"name" : self.nameLabel, @"image" : self.imageView};

    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-(5)-[image]-(5)-[name]-|"
                                                                             options:NSLayoutFormatAlignAllCenterY
                                                                             metrics:nil
                                                                               views:views]];

    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1
                                                                  constant:0]];

    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1
                                                                  constant:0]];
}

@end
