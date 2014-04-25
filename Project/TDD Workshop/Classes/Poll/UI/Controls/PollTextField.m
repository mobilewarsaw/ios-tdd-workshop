#import "PollTextField.h"


@implementation PollTextField {

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

        UITextField *textField = [UITextField new];
        textField.translatesAutoresizingMaskIntoConstraints = NO;
        textField.inputAccessoryView = [UIView new];
        textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
        textField.layer.borderWidth = 1.0f;
        textField.layer.cornerRadius = 6;
        [self addSubview:textField];
        _textField = textField;

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
            @"textfield" : self.textField,
    };
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[title]-[textfield(34)]|"
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
