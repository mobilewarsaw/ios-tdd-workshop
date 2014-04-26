#import "Specs.h"

#import "CommentValidator.h"

SpecBegin(CommentValidatorSpec)

describe(@"CommentValidator", ^{
    __block CommentValidator *validator;

    beforeEach(^{
        validator = [CommentValidator new];
    });

    afterEach(^{
        validator = nil;
    });

    describe(@"validation", ^{

        it(@"should pass, more than 10 chars", ^{
            BOOL isValid = [validator validateText:@"asdjklzxcvbm"];
            expect(isValid).to.beTruthy();
        });

        it(@"should not pass, less than 10 chars", ^{
            BOOL isValid = [validator validateText:@"asdj"];
            expect(isValid).to.beFalsy();
        });

    });

});

SpecEnd
