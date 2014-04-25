#import "Specs.h"

#import "AgendaCollectionViewDataSource.h"
#import "AgendaCollectionViewCell.h"
#import "FakeAgendaProvider.h"
#import "AgendaItem.h"
#import "FakeCollectionView.h"
#import "AgendaItemFixture.h"
#import "Speaker.h"

SPEC_BEGIN(AgendaCollectionViewDataSource)

describe(@"AgendaCollectionViewDataSource", ^{
    __block AgendaCollectionViewDataSource *dataSource;

    beforeEach(^{
        dataSource = [[AgendaCollectionViewDataSource alloc] init];
    });

    afterEach(^{
        dataSource = nil;
    });

    describe(@"setup collection view", ^{
        __block FakeCollectionView *fakeCollectionView;
        beforeEach(^{
            fakeCollectionView = [FakeCollectionView new];
            [dataSource setupWithCollectionView:(id) fakeCollectionView];
        });

        it(@"should set self as collection view's data source", ^{
            expect(fakeCollectionView.dataSource).to.equal(dataSource);
        });

        it(@"should register AgendaCollectionViewCell class for AgendaCollectionViewCellId", PENDING);
    });

    describe(@"number of items", ^{
        __block FakeAgendaProvider *fakeAgendaProvider;
        beforeEach(^{
            fakeAgendaProvider = [FakeAgendaProvider new];
            dataSource.agendaProvider = (id) fakeAgendaProvider;
        });

        context(@"when agenda provider contains 1 item", ^{
            beforeEach(^{
                fakeAgendaProvider.agendaItems = @[
                    [AgendaItem new]
                ];
            });

            it(@"should return 1 item count for first section", ^{
                NSInteger numberOfItems = [dataSource collectionView:nil numberOfItemsInSection:0];
                expect(numberOfItems).to.equal(1);
            });
        });

        context(@"when agenda provider contains 3 items", ^{
            it(@"should return 3 items count for first section", PENDING);
        });

        context(@"when agenda provider contains 0 items", ^{
            it(@"should return 0 items count for first section", PENDING);
        });
    });

    describe(@"returned cell for agenda item", ^{
        __block FakeCollectionView *fakeCollectionView;
        __block NSIndexPath *indexPath;

        beforeEach(^{
            fakeCollectionView = [FakeCollectionView new];
            fakeCollectionView.cellToDequeue = [AgendaCollectionViewCell new];

            indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        });

        it(@"should have title text set", PENDING);

        it(@"should have start date text set", PENDING);

        it(@"should have duration text set", PENDING);

        it(@"should have speakers text set", PENDING);

        context(@"when have 2 speakers", ^{
            it(@"should list all of them", PENDING);
        });

        context(@"with item type", ^{
            it(@"should have different typeView's background color per type", PENDING);
        });
    });
});

SPEC_END
