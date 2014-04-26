#import "NameValidator.h"


@implementation NameValidator
- (BOOL)validateText:(NSString *)text {
    BOOL isNotValid = [text length] > 0 && [text rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound;
    if (isNotValid) {
        [self displayAlertViewWithText:@"Wrong characters!"];
    }
    return !isNotValid;
}

@end
