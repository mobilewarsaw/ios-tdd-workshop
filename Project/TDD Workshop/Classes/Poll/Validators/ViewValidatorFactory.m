#import "ViewValidatorFactory.h"
#import "NameValidator.h"
#import "EMailValidator.h"
#import "CommentValidator.h"


@implementation ViewValidatorFactory



- (id <Validating>)validatorForView:(UIView *)view {
    return [[self validatorsMap][@(view.tag)] new];
}

- (NSDictionary *)validatorsMap {
    return @{
        @(ValidatorTypeName) : [NameValidator class],
        @(ValidatorTypeEmail) : [EMailValidator class],
        @(ValidatorTypeComment) : [CommentValidator class],
    };
}

@end
