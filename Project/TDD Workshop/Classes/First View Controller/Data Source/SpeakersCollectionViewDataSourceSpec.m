#import <UIKit/UIKit.h>
#import "Specs.h"

#import "SpeakersCollectionViewDataSource.h"
#import "Speaker.h"

SPEC_BEGIN(SpeakersCollectionViewDataSourceSpec)

describe(@"SpeakersCollectionViewDataSource", ^{
    __block SpeakersCollectionViewDataSource *collectionViewDataSource;

    beforeEach(^{
        Speaker *fixtureSpeaker1 = [[Speaker alloc] init];
        Speaker *fixtureSpeaker2 = [[Speaker alloc] init];

        NSArray *speakers = @[fixtureSpeaker1, fixtureSpeaker2];

        collectionViewDataSource = [[SpeakersCollectionViewDataSource alloc] initWithSpeakers:speakers];
    });

    afterEach(^{
        collectionViewDataSource = nil;
    });

    describe(@"collection view data source", ^{
        describe(@"number of items", ^{

            __block NSInteger numberOfItems;

            beforeEach(^{
                numberOfItems = [collectionViewDataSource collectionView:nil numberOfItemsInSection:0];
            });

            it(@"should return number of items equal to number of speakers", ^{
                expect(numberOfItems).to.equal(2);
            });
        });

        describe(@"cell for row at index path", ^{

            __block UICollectionViewCell *cell;

            beforeEach(^{
                cell = [collectionViewDataSource collectionView:nil cellForItemAtIndexPath:nil];
            });


        });
    });
});

SPEC_END
