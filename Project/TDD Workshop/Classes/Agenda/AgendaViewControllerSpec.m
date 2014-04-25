#import "Specs.h"

#import "AgendaViewController.h"
#import "AgendaProvider.h"
#import "AgendaCollectionViewDataSource.h"

SPEC_BEGIN(AgendaViewController)

describe(@"AgendaViewController", ^{
    __block AgendaViewController *viewController;

    beforeEach(^{
        viewController = [[AgendaViewController alloc] init];
    });

    afterEach(^{
        viewController = nil;
    });

    describe(@"title", ^{
        it(@"should be set to 'Agenda'", ^{
            expect(viewController.title).to.equal(@"Agenda");
        });
    });

    describe(@"tab bar item", ^{
        it(@"should have a agenda image", PENDING);

        it(@"should have a 'Agenda' title", PENDING);
    });

    describe(@"setup", ^{
        it(@"should use UICollectionViewFlowLayout", PENDING);

        it(@"should initialize agenda provider", ^{
            expect(viewController.agendaProvider).notTo.beNil();
        });

        it(@"should initialize agenda data source", ^{
            expect(viewController.agendaDataSource).notTo.beNil();
        });

        it(@"should initialize agenda data source with agenda provider", PENDING);
    });

    describe(@"loaded collection view", ^{
        __block UICollectionView *collectionView;

        beforeEach(^{
            [viewController loadView];
            [viewController viewDidLoad];

            collectionView = viewController.collectionView;
        });

        it(@"should have white background color", PENDING); //HINT: backgroundColor

        it(@"should always bounce verticaly", PENDING);     //HINT: alwaysBounceVertical

        it(@"should should be inseted by 10 px from top and bottom", PENDING); //HINT: contentInset
    });

    describe(@"subviews layout", ^{
        beforeEach(^{
            [viewController viewDidLayoutSubviews];
        });

        it(@"should update flow layout's item size to {view.width, 66}", PENDING);
    });

    describe(@"collection view's data source", ^{
        it(@"should return 1 section", ^{
            NSInteger numberOfSections = [viewController.collectionView.dataSource numberOfSectionsInCollectionView:viewController.collectionView];
            expect(numberOfSections).to.equal(1);
        });

        it(@"should return 0 items for first section", PENDING);
    });
});

SPEC_END
