#import "Specs.h"

#import "AgendaProvider.h"

SPEC_BEGIN(AgendaProvider)

describe(@"AgendaProvider", ^{
    __block AgendaProvider *agendaProvider;

    beforeEach(^{
        agendaProvider = [[AgendaProvider alloc] init];
    });

    afterEach(^{
        agendaProvider = nil;
    });
});

SPEC_END
