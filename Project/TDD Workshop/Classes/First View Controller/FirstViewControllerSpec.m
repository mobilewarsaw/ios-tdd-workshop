#import "Specs.h"

#import "FirstViewController.h"

SPEC_BEGIN(FirstViewControllerSpec)

describe(@"FirstViewController", ^{
    __block FirstViewController *viewController;

    beforeEach(^{
        viewController = [[FirstViewController alloc] init];;
    });

    afterEach(^{
        viewController = nil;
    });

    describe(@"", ^{

    });
});

SPEC_END
