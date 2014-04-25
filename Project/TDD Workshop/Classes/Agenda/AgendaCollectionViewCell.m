//
//  TDD Workshop
//
//  Created by Lukasz Warchol on 22/04/14.
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//


#import "AgendaCollectionViewCell.h"
#import "UIColor+TDDWorkshop.h"


@implementation AgendaCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor barsBackgroundTintColor] colorWithAlphaComponent:0.3];

        UIView *typeView = [UIView new];
        typeView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:typeView];
        _typeView = typeView;

        UILabel *titleLabel = [self newLabelWithTextStyle:UIFontTextStyleBody];
        [self.contentView addSubview:titleLabel];
        _titleLabel = titleLabel;

        UILabel *startDataLabel = [self newLabelWithTextStyle:UIFontTextStyleCaption1];
        startDataLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:startDataLabel];
        _startDateLabel = startDataLabel;

        UILabel *durationLabel = [self newLabelWithTextStyle:UIFontTextStyleFootnote];
        durationLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:durationLabel];
        _durationLabel = durationLabel;

        UILabel *speakersLabel = [self newLabelWithTextStyle:UIFontTextStyleFootnote];
        speakersLabel.numberOfLines = 0;
        [self.contentView addSubview:speakersLabel];
        _speakersLabel = speakersLabel;

        [self setNeedsUpdateConstraints];
    }

    return self;
}

- (UILabel *)newLabelWithTextStyle:(NSString *)textStyle {
    UILabel *label = [UILabel new];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.font = [UIFont preferredFontForTextStyle:textStyle];
    label.textColor = [UIColor blackColor];
    return label;
}

#pragma mark - Layout

- (void)updateConstraints {
    [self removeConstraints:self.constraints];

    NSDictionary *views = @{
            @"type" : self.typeView,
            @"title" : self.titleLabel,
            @"start" : self.startDateLabel,
            @"duration" : self.durationLabel,
            @"speakers" : self.speakersLabel,
    };

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[type(40)]-[title]"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:views]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[title]-(>=0)-[duration]-(5)-|"
                                                                 options:NSLayoutFormatAlignAllCenterY
                                                                 metrics:nil
                                                                   views:views]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[type]|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:views]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[title]-[start]-[speakers]|"
                                                                 options:NSLayoutFormatAlignAllLeft
                                                                 metrics:nil
                                                                   views:views]];

    [super updateConstraints];
}

@end
