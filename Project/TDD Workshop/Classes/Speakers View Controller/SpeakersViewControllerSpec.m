#import "Specs.h"

#import "SpeakersViewController.h"
#import "SpeakersCollectionViewDataSource.h"

SPEC_BEGIN(SpeakersViewController)

describe(@"SpeakersViewController", ^{
    __block SpeakersViewController *viewController;

    beforeEach(^{
        viewController = [[SpeakersViewController alloc] init];
    });

    afterEach(^{
        viewController = nil;
    });

    describe(@"speakers data source", ^{

        __block SpeakersCollectionViewDataSource *dataSource;

        beforeEach(^{
            dataSource = [viewController speakersDataSource];
        });

        it(@"should be a speakers data source", ^{
            expect(dataSource).to.beKindOf([SpeakersCollectionViewDataSource class]);
        });

        it(@"should be view controllers collection view delegate", ^{
            expect(viewController.collectionView.dataSource).to.equal(dataSource);
        });

        describe(@"speakers", ^{

            __block NSArray *speakers;

            beforeEach(^{
                speakers = [dataSource speakers];
            });

            it(@"should have 4 speakers", ^{
                expect(speakers).to.haveCountOf(4);
            });
        });
    });

    describe(@"view", ^{

        __block UICollectionView *collectionView;

        beforeEach(^{
            collectionView = [viewController collectionView];
        });

        describe(@"layout", ^{

            __block UICollectionViewFlowLayout *layout;

            beforeEach(^{
                layout = (UICollectionViewFlowLayout *) [collectionView collectionViewLayout];
            });

            it(@"should be a flow layout", ^{
                expect(layout).to.beKindOf([UICollectionViewFlowLayout class]);
            });


            describe(@"when the view lays out it subviews", ^{
                beforeEach(^{
                    viewController.view.bounds = CGRectMake(0, 0, 42, 22);
                    [viewController.view layoutIfNeeded];
                });

                it(@"should set item size on the collection view layout", ^{
                    expect(layout.itemSize).to.equal(CGSizeMake(42, 44));
                });
            });
        });
    });
});

SPEC_END
