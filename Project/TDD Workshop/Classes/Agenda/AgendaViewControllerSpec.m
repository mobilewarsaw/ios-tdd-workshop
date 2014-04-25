#import "Specs.h"

#import "AgendaViewController.h"

SPEC_BEGIN(AgendaViewController)

describe(@"AgendaViewController", ^{
    __block AgendaViewController *viewController;

    beforeEach(^{
        viewController = [[AgendaViewController alloc] init];
    });

    afterEach(^{
        viewController = nil;
    });
});

SPEC_END
