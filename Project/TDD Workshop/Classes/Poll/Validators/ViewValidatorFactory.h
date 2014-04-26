#import <Foundation/Foundation.h>
#import "Validating.h"

typedef NS_ENUM(NSInteger , ValidatorType) {
    ValidatorTypeName = 1,
    ValidatorTypeEmail = 2,
    ValidatorTypeComment = 3
};

@interface ViewValidatorFactory : NSObject

- (id <Validating>)validatorForView:(UIView *)view;

@end
