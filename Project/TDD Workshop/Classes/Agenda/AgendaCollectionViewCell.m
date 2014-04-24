#import "AgendaCollectionViewCell.h"
#import "AgendaItem.h"
#import "Speaker.h"


@implementation AgendaCollectionViewCell {

}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
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

#pragma mark - Configuration

- (void)configureForAgendaItem:(AgendaItem *)item {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    [formatter setLocale:[NSLocale currentLocale]];

    self.titleLabel.text = item.title;
    self.startDateLabel.text = [formatter stringFromDate:item.startDate];
    self.durationLabel.text = [NSString stringWithFormat:@"%.0fm", item.duration / 60];

    NSMutableArray *speakersNames = [NSMutableArray array];
    for (Speaker *speaker in item.speakers) {
        [speakersNames addObject:speaker.name];
    }
    self.speakersLabel.text = [speakersNames componentsJoinedByString:@", "];
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
