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
    }

    return self;
}

@end
