#import "PollTextView.h"


@implementation PollTextView {

}

+ (instancetype)fieldWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title];
}

- (instancetype)initWithTitle:(NSString *)title {
    self = [super initWithFrame:CGRectZero];
    if (self) {

        UILabel *titleLabel = [self newLabelWithTextStyle:UIFontTextStyleBody];
        titleLabel.text = title;
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;

        UITextView *textView = [UITextView new];
        textView.translatesAutoresizingMaskIntoConstraints = NO;
        textView.inputAccessoryView = [UIView new];
        textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        textView.layer.borderWidth = 1.0f;
        textView.layer.cornerRadius = 6;
        [self addSubview:textView];
        _textView = textView;

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
            @"textfield" : self.textView,
    };
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[title]-[textfield(100)]|"
                                                                 options:NSLayoutFormatAlignAllLeft
                                                                 metrics:nil
                                                                   views:views]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[textfield(280)]|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:views]];


    [super updateConstraints];
}

@end
