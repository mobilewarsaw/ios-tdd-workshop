#import "EMailValidator.h"


@implementation EMailValidator {

}

- (BOOL)validateText:(NSString *)text {
    BOOL isValid = [self isValidEmail:text];
    if (!isValid) {
        [self displayAlertViewWithText:@"Wrong email address!"];
    }
    return isValid;
}

- (BOOL)isValidEmail:(NSString *)checkString {
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

@end
