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
#import "AgendaProvider+SharedInstance.h"


@implementation PollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = [PollManager sharedInstance].title;
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:self.title
                                                        image:[[UIImage imageNamed:@"Poll"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]
                                                          tag:0];
        [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    }

    return self;
}

- (PollView *)castView {
    return (PollView *) self.view;
}

- (void)loadView {
    NSArray *items = [AgendaProvider sharedInstance].agendaItems;
    PollView *view = [[PollView alloc] initWithAgendaItem:items];
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureControlCallbacks];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    BOOL pollCompleted = [PollManager sharedInstance].isPollCompleted;
    [self.castView setPollCompleted:pollCompleted];
    if (!pollCompleted) {
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Send"
                                                                 style:UIBarButtonItemStyleDone
                                                                target:self
                                                                action:@selector(didTapDone:)];
        [self.navigationItem setRightBarButtonItem:item animated:YES];
    } else {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

- (void)configureControlCallbacks {
    self.castView.nameField.textField.delegate = self;
    self.castView.emailField.textField.delegate = self;
    self.castView.commentsView.textView.delegate = self;
}

- (void)didTapDone:(id)sender {
    [self displayAlertViewWithText:@"You can send it only once. Do you want to continue?" delegate:self];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    BOOL shouldSendData = buttonIndex != alertView.cancelButtonIndex && ![PollManager sharedInstance].isPollCompleted;
    if (shouldSendData) {

        NSMutableArray *agendaPollValues = [NSMutableArray array];
        for (PollSlider *slider in self.castView.agendaSliders) {
            [agendaPollValues addObject:[PollSliderItem valueWithTitle:slider.titleLabel.text
                                                                 value:@([slider.multisectorControl.sectors.firstObject endValue])]];
        }

        Poll *poll = [Poll pollWithFullName:self.castView.nameField.textField.text
                                      email:self.castView.emailField.textField.text
                          additionalComment:self.castView.commentsView.textView.text
                        generalFeelingValue:@([self.castView.generalSlider.multisectorControl.sectors.firstObject endValue])
                           agendaItemValues:agendaPollValues];

        [[PollManager sharedInstance] sendPoll:poll completion:^(BOOL succeeded) {
            if (succeeded) {
                [self.castView setPollCompleted:YES];
                [self.navigationItem setRightBarButtonItem:nil animated:YES];
            }
        }];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField.text length] == 0) {
        return;
    }
    if ([textField isEqual:self.castView.emailField.textField]) {
        if (![self isValidEmail:textField.text]) {
            [self displayAlertViewWithText:@"Wrong email!" delegate:nil];
            textField.text = @"";
        }
    } else if ([textField isEqual:self.castView.nameField.textField]) {
        if ([textField.text rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound) {
            [self displayAlertViewWithText:@"Wrong characters!" delegate:nil];
            textField.text = @"";
        }
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([textView.text length] < 10) {
        [self displayAlertViewWithText:@"Too less characters!" delegate:nil];
        textView.text = @"";
    }
}

- (BOOL)isValidEmail:(NSString *)checkString {
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (void)displayAlertViewWithText:(NSString *)text delegate:(id)delegate {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Info"
                                                        message:text
                                                       delegate:delegate
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"OK", nil];
    [alertView show];
}

@end
