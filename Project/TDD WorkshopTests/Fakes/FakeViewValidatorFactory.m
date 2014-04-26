#import "FakeViewValidatorFactory.h"
#import "SpecValidatorFixture.h"


@implementation FakeViewValidatorFactory {

}

- (id <Validating>)validatorForView:(UIView *)view {
    return self.validator;
}

@end
