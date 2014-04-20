#import "Specs.h"

#import "SpeakersViewController.h"
#import "SpeakersCollectionViewDataSource.h"

SPEC_BEGIN(FirstViewControllerSpec)

describe(@"SpeakersViewController", ^{
    __block SpeakersViewController *viewController;

    beforeEach(^{
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        viewController = [[SpeakersViewController alloc] initWithCollectionViewLayout:flowLayout];
        [viewController awakeFromNib];
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

    describe(@"", ^{

    });
});

SPEC_END
