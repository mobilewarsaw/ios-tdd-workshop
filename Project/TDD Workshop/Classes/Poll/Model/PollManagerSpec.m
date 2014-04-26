#import "Specs.h"

#import "PollManager.h"

SPEC_BEGIN(PollManagerSpec)

describe(@"PollManager", ^{
    __block PollManager *manager;

    beforeEach(^{
        manager = [PollManager new];
    });

    afterEach(^{
        manager = nil;
    });

    describe(@"initialization", ^{

        it(@"should return proper title", ^{
            expect(manager.title).to.equal(@"Poll");
        });

    });

});

SPEC_END
