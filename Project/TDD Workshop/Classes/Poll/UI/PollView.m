#import "PollView.h"
#import "PollTextField.h"
#import "PollSlider.h"
#import "AgendaItem.h"
#import "SAMultisectorControl.h"
#import "PollTextView.h"
#import "NSLayoutConstraint+Utilities.h"
#import "View+MASAdditions.h"
#import "UIColor+TDDWorkshop.h"


@implementation PollView

- (id)initWithAgendaItem:(NSArray *)agendaItems {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.alwaysBounceVertical = YES;

        PollTextField *nameField = [PollTextField fieldWithTitle:@"Full Name"];
        nameField.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:nameField];
        _nameField = nameField;

        PollTextField *emailField = [PollTextField fieldWithTitle:@"Email"];
        emailField.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:emailField];
        _emailField = emailField;

        PollSlider *generalSlider = [PollSlider fieldWithTitle:@"General feeling" color:[UIColor textColor]];
        generalSlider.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:generalSlider];
        _generalSlider = generalSlider;

        NSMutableArray *sliders = [self createSliders:agendaItems];
        _agendaSliders = sliders;

        PollTextView *commentsView = [PollTextView fieldWithTitle:@"Additional comments"];
        commentsView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:commentsView];
        _commentsView = commentsView;

        UILabel *completedPollLabel = [self newLabelWithTextStyle:UIFontTextStyleHeadline];
        completedPollLabel.translatesAutoresizingMaskIntoConstraints = NO;
        completedPollLabel.text = @"Thank you for taking part in the poll.";
        completedPollLabel.numberOfLines = 0;
        completedPollLabel.hidden = YES;
        [self addSubview:completedPollLabel];
        _completedPollLabel = completedPollLabel;

        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (NSMutableArray *)createSliders:(NSArray *)agendaItems {
    UIColor *color = [UIColor textColor];
    NSMutableArray *sliders = [NSMutableArray array];
    [agendaItems enumerateObjectsUsingBlock:^(AgendaItem *agendaItem, NSUInteger idx, BOOL *stop) {
        PollSlider *slider = [PollSlider fieldWithTitle:agendaItem.title color:color];
        slider.translatesAutoresizingMaskIntoConstraints = NO;
        slider.multisectorControl.tag = idx;
        [self addSubview:slider];
        [sliders addObject:slider];
    }];
    return sliders;
}

- (void)setPollCompleted:(BOOL)completed {
    self.nameField.hidden = completed;
    self.emailField.hidden = completed;
    self.generalSlider.hidden = completed;
    self.commentsView.hidden = completed;
    for (PollSlider *slider in self.agendaSliders) {
        slider.hidden = completed;
    }
    self.completedPollLabel.hidden = !completed;
    [self setContentOffset:CGPointZero];
    self.scrollEnabled = !completed;
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

    NSMutableDictionary *views = [@{
            @"name" : self.nameField,
            @"email" : self.emailField,
            @"general" : self.generalSlider,
            @"comments" : self.commentsView,
    } mutableCopy];

    NSArray *constraintsStrings = [self constraintsStringsForSlidersAndViews:views];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormatArray:constraintsStrings
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil
                                                                        views:views]];

    [self.completedPollLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
    }];

    [super updateConstraints];
}

- (NSArray *)constraintsStringsForSlidersAndViews:(NSMutableDictionary *)views {
    NSMutableArray *constraintsStrings = [@[
            @"H:|-[name]-|",
            @"H:|-[email]-|",
            @"H:|-[general]-|",
            @"H:|-[comments]-|"
    ] mutableCopy];

    __block NSString *verticalConstraintString = @"V:|-[name]-[email]-[general]-";

    [self.agendaSliders enumerateObjectsUsingBlock:^(PollSlider *slider, NSUInteger idx, BOOL *stop) {
        NSString *marker = [NSString stringWithFormat:@"slider_%@", @(idx)];
        views[marker] = slider;

        NSString *horizontalConstraintString = [NSString stringWithFormat:@"H:|-[%@]-|", marker];
        [constraintsStrings addObject:horizontalConstraintString];

        verticalConstraintString = [verticalConstraintString stringByAppendingFormat:@"[%@]-", marker];
    }];
    verticalConstraintString = [verticalConstraintString stringByAppendingString:@"[comments]-|"];

    [constraintsStrings addObject:verticalConstraintString];

    return constraintsStrings;
}


@end
