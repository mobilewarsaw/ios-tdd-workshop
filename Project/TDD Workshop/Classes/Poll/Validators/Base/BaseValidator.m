#import "BaseValidator.h"


@implementation BaseValidator {

}

- (void)displayAlertViewWithText:(NSString *)text {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                        message:text
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

@end
