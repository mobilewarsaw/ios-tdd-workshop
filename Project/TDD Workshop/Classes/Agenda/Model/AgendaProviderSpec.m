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

    it(@"should have 7 agenda items", ^{
        expect(agendaProvider.agendaItems.count).to.equal(7);
    });
});

SPEC_END
