#import <UIKit/UIKit.h>
#import "Specs.h"

#import "SpeakersCollectionViewDataSource.h"
#import "Speaker.h"
#import "SpeakerCollectionViewCell.h"

SPEC_BEGIN(SpeakersCollectionViewDataSource)

describe(@"SpeakersCollectionViewDataSource", ^{
    __block SpeakersCollectionViewDataSource *collectionViewDataSource;

    beforeEach(^{
        Speaker *fixtureSpeaker1 = [[Speaker alloc] initWithName:@"Fixture Name 1" photo:nil];
        Speaker *fixtureSpeaker2 = [[Speaker alloc] initWithName:@"Fixture Name 2" photo:nil];

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

            __block SpeakerCollectionViewCell *cell;
            __block UICollectionView *collectionView;
            __block UICollectionViewFlowLayout *layout;

            beforeEach(^{
                layout = [[UICollectionViewFlowLayout alloc] init];
                collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                                    collectionViewLayout:layout];
                collectionView.dataSource = collectionViewDataSource;

                [collectionView registerClass:[SpeakerCollectionViewCell class]
                   forCellWithReuseIdentifier:SpeakersCollectionViewCellIdentifier];
            });

            context(@"when it's the first row", ^{
                beforeEach(^{
                    cell = (id) [collectionViewDataSource collectionView:collectionView
                                                  cellForItemAtIndexPath:[NSIndexPath indexPathForRow:0
                                                                                            inSection:0]];
                });

                it(@"should set the text of name label on cell to first speakers name", ^{
                    expect(cell.nameLabel.text).to.equal(@"Fixture Name 1");
                });
            });

            context(@"when it's the second row", ^{
                beforeEach(^{
                    cell = (id) [collectionViewDataSource collectionView:collectionView
                                                  cellForItemAtIndexPath:[NSIndexPath indexPathForRow:1
                                                                                            inSection:0]];
                });

                it(@"should set the text of name label on cell to first speakers name", ^{
                    expect(cell.nameLabel.text).to.equal(@"Fixture Name 2");
                });
            });
        });
    });
});

SPEC_END
