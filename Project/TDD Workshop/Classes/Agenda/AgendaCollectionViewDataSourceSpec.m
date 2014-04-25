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

        it(@"should register AgendaCollectionViewCell class for AgendaCollectionViewCellId", ^{
            expect(fakeCollectionView.registeredClass).to.equal([AgendaCollectionViewCell class]);
            expect(fakeCollectionView.registerIndentifier).to.equal(@"AgendaCollectionViewCellId");
        });
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
            beforeEach(^{
                fakeAgendaProvider.agendaItems = @[
                    [AgendaItem new],
                    [AgendaItem new],
                    [AgendaItem new]
                ];
            });

            it(@"should return 3 items count for first section", ^{
                NSInteger numberOfItems = [dataSource collectionView:nil numberOfItemsInSection:0];
                expect(numberOfItems).to.equal(3);
            });
        });

        context(@"when agenda provider contains 0 items", ^{
            it(@"should return 0 items count for first section", ^{
                NSInteger numberOfItems = [dataSource collectionView:nil numberOfItemsInSection:0];
                expect(numberOfItems).to.equal(0);
            });
        });
    });

    describe(@"returned cell for agenda item", ^{
        __block FakeCollectionView *fakeCollectionView;
        __block NSIndexPath *indexPath;

        __block FakeAgendaProvider *fakeAgendaProvider;
        __block AgendaItemFixture *agendaItemFixture;

        beforeEach(^{
            fakeCollectionView = [FakeCollectionView new];
            fakeCollectionView.cellToDequeue = [AgendaCollectionViewCell new];

            fakeAgendaProvider = [FakeAgendaProvider new];
            dataSource.agendaProvider = (id) fakeAgendaProvider;

            agendaItemFixture = [AgendaItemFixture new];
            fakeAgendaProvider.agendaItems = @[agendaItemFixture];

            indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        });

        it(@"should have title text set", ^{
            AgendaCollectionViewCell *cell = (id) [dataSource collectionView:(id) fakeCollectionView
                                                      cellForItemAtIndexPath:indexPath];
            expect(cell.titleLabel.text).to.equal(@"Spec Session");
        });

        it(@"should have start date text set", ^{
            AgendaCollectionViewCell *cell = (id) [dataSource collectionView:(id) fakeCollectionView
                                                      cellForItemAtIndexPath:indexPath];
            expect(cell.startDateLabel.text).to.equal(@"1/1/70, 1:00 AM");
        });

        it(@"should have duration text set", ^{
            AgendaCollectionViewCell *cell = (id) [dataSource collectionView:(id) fakeCollectionView
                                                      cellForItemAtIndexPath:indexPath];
            expect(cell.durationLabel.text).to.equal(@"30m");
        });

        it(@"should have speakers text set", ^{
            AgendaCollectionViewCell *cell = (id) [dataSource collectionView:(id) fakeCollectionView
                                                      cellForItemAtIndexPath:indexPath];
            expect(cell.speakersLabel.text).to.equal(@"Bill Gates");
        });

        context(@"when have 2 speakers", ^{
            beforeEach(^{
                agendaItemFixture.speakers = @[
                    [[Speaker alloc] initWithName:@"Speaker1" photo:nil],
                    [[Speaker alloc] initWithName:@"Speaker2" photo:nil]
                ];
            });

            it(@"should list all of them", ^{
                AgendaCollectionViewCell *cell = (id) [dataSource collectionView:(id) fakeCollectionView
                                                          cellForItemAtIndexPath:indexPath];
                expect(cell.speakersLabel.text).to.equal(@"Speaker1, Speaker2");
            });
        });

        context(@"with item type", ^{
            it(@"should have different typeView's background color per type", PENDING);
        });
    });
});

SPEC_END
