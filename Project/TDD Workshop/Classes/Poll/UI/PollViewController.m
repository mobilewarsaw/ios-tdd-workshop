#import "PollViewController.h"
#import "PollView.h"
#import "AgendaProvider.h"
#import "PollManager.h"
#import "IQKeyboardManager.h"
#import "PollTextField.h"
#import "PollSlider.h"
#import "SAMultisectorControl.h"
#import "PollTextView.h"
#import "PollSliderItem.h"
#import "Poll.h"
#import "ViewValidatorFactory.h"

@implementation PollViewController

- (instancetype)initWithPollManager:(PollManager *)pollManager agendaProvider:(AgendaProvider *)agendaProvider {
    self = [super init];
    if (self) {
        _pollManager = pollManager;
        _agendaProvider = agendaProvider;

        self.title = pollManager.title;
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:pollManager.title
                                                        image:[[UIImage imageNamed:@"Poll"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]
                                                          tag:0];
        [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    }

    return self;
}

- (PollView *)castView {
    return (PollView *) self.view;
}

#pragma mark - UIViewController

- (void)loadView {
    self.view = [[PollView alloc] initWithAgendaItem:self.agendaProvider.agendaItems];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureControlCallbacks];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self configureRightNavigationItem:self.pollManager.isPollCompleted];
    [self.castView setPollCompleted:self.pollManager.isPollCompleted];
}

- (void)configureRightNavigationItem:(BOOL)isPollCompleted {
    if (!isPollCompleted) {
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Send"
                                                                 style:UIBarButtonItemStyleDone
                                                                target:self
                                                                action:@selector(didTapDone:)];
        self.navigationItem.rightBarButtonItem = item;
    } else {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

#pragma mark - Config

- (void)configureControlCallbacks {
    self.castView.nameField.textField.delegate = self;
    self.castView.nameField.textField.tag = ValidatorTypeName;
    self.castView.emailField.textField.delegate = self;
    self.castView.emailField.textField.tag = ValidatorTypeEmail;
    self.castView.commentsView.textView.delegate = self;
    self.castView.commentsView.textView.tag = ValidatorTypeComment;
}

- (void)didTapDone:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                        message:@"You can send it only once. Do you want to continue?"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"OK", nil];
    [alertView show];
}

#pragma mark - Actions

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    BOOL userConfirmed = buttonIndex != alertView.cancelButtonIndex;
    if (userConfirmed && !self.pollManager.isPollCompleted) {
        [self sendPollData];
    }
}

- (void)sendPollData {
    PollView *view = self.castView;
    NSArray *agendaSliders = view.agendaSliders;
    NSArray *agendaPollValues = [self collectValuesFromSliders:agendaSliders];

    NSNumber *generalFeelingValue = @([view.generalSlider.multisectorControl.sectors.firstObject endValue]);
    Poll *poll = [Poll pollWithFullName:view.nameField.textField.text
                                  email:view.emailField.textField.text
                      additionalComment:view.commentsView.textView.text
                    generalFeelingValue:generalFeelingValue
                       agendaItemValues:agendaPollValues];

    [self.pollManager sendPoll:poll completion:^(BOOL succeeded) {
        if (succeeded) {
            [view setPollCompleted:YES];
            [self.navigationItem setRightBarButtonItem:nil animated:YES];
        }
    }];
}

- (NSArray *)collectValuesFromSliders:(NSArray *)agendaSliders {
    NSMutableArray *agendaPollValues = [NSMutableArray array];
    for (PollSlider *slider in agendaSliders) {
        [agendaPollValues addObject:[PollSliderItem valueWithTitle:slider.titleLabel.text
                                                             value:@([slider.multisectorControl.sectors.firstObject endValue])]];
    }
    return agendaPollValues;
}

#pragma mark - Delegates

- (void)textFieldDidEndEditing:(UITextField *)textField {
    id <Validating> validator = [ViewValidatorFactory validatorForView:textField];
    [validator validateText:textField.text];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    id <Validating> validator = [ViewValidatorFactory validatorForView:textView];
    [validator validateText:textView.text];
}

@end
