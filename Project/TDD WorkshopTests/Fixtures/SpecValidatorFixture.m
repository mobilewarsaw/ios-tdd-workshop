#import "SpecValidatorFixture.h"


@implementation SpecValidatorFixture {

}

- (BOOL)validateText:(NSString *)text {
    self.didCallValidateText = YES;
    return NO;
}

@end
