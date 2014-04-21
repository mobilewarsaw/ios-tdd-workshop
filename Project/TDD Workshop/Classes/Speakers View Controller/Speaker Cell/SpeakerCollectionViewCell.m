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
        [self.contentView addSubview:self.nameLabel];

        self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;

        NSDictionary *views = @{@"name" : self.nameLabel};

        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[name]-|"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:views]];

        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(5)-[name]-(5)-|"
                                                                                         options:0
                                                                                         metrics:nil
                                                                                           views:views]];
    }

    return self;
}

@end
