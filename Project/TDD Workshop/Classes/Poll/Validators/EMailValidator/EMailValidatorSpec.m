#import "Specs.h"

#import "EMailValidator.h"

SPEC_BEGIN(EMailValidatorSpec)

describe(@"EMailValidator", ^{
    __block EMailValidator *validator;

    beforeEach(^{
        validator = [EMailValidator new];
    });

    afterEach(^{
        validator = nil;
    });

    describe(@"validation", ^{
        it(@"should pass, correct address", ^{
            BOOL isValid = [validator validateText:@"example@example.com"];
            expect(isValid).to.beTruthy();
        });

        it(@"should not pass, incorrect address", ^{
            BOOL isValid = [validator validateText:@"example.com"];
            expect(isValid).to.beFalsy();
        });
    });
});

SPEC_END
