#import "PollSlider.h"
#import "SAMultisectorControl.h"


@implementation PollSlider

+ (instancetype)fieldWithTitle:(NSString *)title color:(UIColor *)color {
    return [[self alloc] initWithTitle:title color:color];
}

- (instancetype)initWithTitle:(NSString *)title color:(UIColor *)color {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        UILabel *titleLabel = [self newLabelWithTextStyle:UIFontTextStyleBody];
        titleLabel.text = title;
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;

        SAMultisectorControl *multisectorControl = [SAMultisectorControl new];
        multisectorControl.translatesAutoresizingMaskIntoConstraints = NO;
        multisectorControl.sectorsRadius = 80.0;
        [self addSubview:multisectorControl];
        _multisectorControl = multisectorControl;

        SAMultisectorSector *sector = [SAMultisectorSector sectorWithColor:color maxValue:10.0];
        sector.endValue = 8.0;
        [_multisectorControl addSector:sector];

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

- (void)updateConstraints {
    [self removeConstraints:self.constraints];

    NSDictionary *views = @{
            @"title" : self.titleLabel,
            @"slider" : self.multisectorControl,
    };
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[title]-[slider(260)]|"
                                                                 options:NSLayoutFormatAlignAllLeft
                                                                 metrics:nil
                                                                   views:views]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[slider]|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:views]];

    [super updateConstraints];
}


@end
