#import "Specs.h"

#import "NameValidator.h"

SPEC_BEGIN(NameValidatorSpec)

describe(@"NameValidator", ^{
    __block NameValidator *validator;

    beforeEach(^{
        validator = [NameValidator new];
    });

    afterEach(^{
        validator = nil;
    });

    describe(@"validation", ^{
        it(@"should pass, non digital chars", ^{
            BOOL isValid = [validator validateText:@"John Dow"];
            expect(isValid).to.beTruthy();
        });

        it(@"should not pass, includes digits", ^{
            BOOL isValid = [validator validateText:@"John 123 Dow"];
            expect(isValid).to.beFalsy();
        });
    });
});

SPEC_END
