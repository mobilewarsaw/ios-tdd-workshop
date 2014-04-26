#import "Specs.h"

#import "ViewValidatorFactory.h"
#import "NameValidator.h"
#import "EMailValidator.h"
#import "CommentValidator.h"

SpecBegin(ViewValidatorFactorySpec)

describe(@"ViewValidatorFactory", ^{
    __block ViewValidatorFactory *factory;

    beforeEach(^{
        factory = [ViewValidatorFactory new];
    });

    afterEach(^{
        factory = nil;
    });

    describe(@"validators creation", ^{
        __block UIView *inputView;

        beforeEach(^{
            inputView = [UIView new];
        });

        afterEach(^{
            inputView = nil;
        });

        describe(@"creating name validator", ^{
            beforeEach(^{
                inputView.tag = ValidatorTypeName;
            });
            
            it(@"should create name validator", ^{
                id <Validating> object = [factory validatorForView:inputView];
                expect(object).to.beKindOf([NameValidator class]);
            });
        });

        describe(@"creating email validator", ^{
            beforeEach(^{
                inputView.tag = ValidatorTypeEmail;
            });

            it(@"should create name validator", ^{
                id <Validating> object = [factory validatorForView:inputView];
                expect(object).to.beKindOf([EMailValidator class]);
            });
        });

        describe(@"creating comment validator", ^{
            beforeEach(^{
                inputView.tag = ValidatorTypeComment;
            });

            it(@"should create name validator", ^{
                id <Validating> object = [factory validatorForView:inputView];
                expect(object).to.beKindOf([CommentValidator class]);
            });
        });

    });
});

SpecEnd
