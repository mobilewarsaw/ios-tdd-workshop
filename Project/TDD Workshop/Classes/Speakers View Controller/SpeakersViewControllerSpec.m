#import "Specs.h"

#import "SpeakersViewController.h"
#import "SpeakersCollectionViewDataSource.h"
#import "Speaker.h"

SPEC_BEGIN(SpeakersViewController)

describe(@"SpeakersViewController", ^{
    __block SpeakersViewController *viewController;

    beforeEach(^{
        viewController = [[SpeakersViewController alloc] init];
    });

    afterEach(^{
        viewController = nil;
    });

    it(@"should have a title", ^{
        expect(viewController.title).to.equal(@"Speakers");
    });

    describe(@"tab bar item", ^{

        __block UITabBarItem *item;

        beforeEach(^{
            item = [viewController tabBarItem];
        });

        it(@"should have a contact image", ^{
            expect(item.selectedImage).to.equal([UIImage imageNamed:@"Contact"]);
        });
    });

    describe(@"speakers data source", ^{

        __block SpeakersCollectionViewDataSource *dataSource;

        beforeEach(^{
            dataSource = [viewController speakersDataSource];
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

            describe(@"first speaker", ^{

                __block Speaker *speaker;

                beforeEach(^{
                    speaker = speakers[0];
                });

                it(@"should have a name", ^{
                    expect(speaker.name).to.equal(@"Paweł Dudek");
                });
            });
        });
    });

    describe(@"view", ^{

        __block UICollectionView *collectionView;

        beforeEach(^{
            collectionView = [viewController collectionView];
        });

        it(@"should always bounces vertically", ^{
            expect(collectionView.alwaysBounceVertical).to.beTruthy();
        });

        describe(@"layout", ^{

            __block UICollectionViewFlowLayout *layout;

            beforeEach(^{
                layout = (UICollectionViewFlowLayout *) [collectionView collectionViewLayout];
            });

            describe(@"when the view lays out it subviews", ^{

                beforeEach(^{
                    viewController.view.bounds = CGRectMake(0, 0, 42, 22);
                    [viewController.view layoutIfNeeded];
                });

                it(@"should set item size on the collection view layout", ^{
                    expect(layout.itemSize).to.equal(CGSizeMake(42, 80));
                });
            });
        });
    });
});

SPEC_END
