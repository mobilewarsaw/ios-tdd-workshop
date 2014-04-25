#import "Specs.h"

#import "AgendaCollectionViewDataSource.h"

SPEC_BEGIN(AgendaCollectionViewDataSource)

describe(@"AgendaCollectionViewDataSource", ^{
    __block AgendaCollectionViewDataSource *dataSource;

    beforeEach(^{
        dataSource = [[AgendaCollectionViewDataSource alloc] init];
    });

    afterEach(^{
        dataSource = nil;
    });
});

SPEC_END
