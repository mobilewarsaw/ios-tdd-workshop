#import "CommentValidator.h"


@implementation CommentValidator

- (BOOL)validateText:(NSString *)text {
    NSUInteger length = [text length];
    BOOL isValid = length > 0 && length >= 10;
    if (!isValid) {
        [self displayAlertViewWithText:@"Less than 10 characters!"];
    }
    return isValid;
}

@end
