#import "Specs.h"
#import "PhotoStreamViewController.h"
#import "StreamItemUploader.h"
#import "StreamItemCreator.h"

SPEC_BEGIN(PhotoStreamViewController)
    describe(@"PhotoStreamViewController", ^{
        __block PhotoStreamViewController *photoStreamViewController;
        beforeEach(^{
            photoStreamViewController = [PhotoStreamViewController new];
        });
        afterEach(^{
            photoStreamViewController = nil;
        });

        describe(@"when created", ^{
            it(@"should have title set", ^{
                expect(photoStreamViewController.title).to.equal(@"Photo Stream");
            });
            it(@"should have right bar button item set", ^{
                expect(photoStreamViewController.navigationItem.rightBarButtonItem).notTo.beNil();
            });
            it(@"should have stream item uploader set", ^{
                expect(photoStreamViewController.streamItemUploader).notTo.beNil();
            });
            it(@"should have stream item creator set", ^{
                expect(photoStreamViewController.streamItemCreator).notTo.beNil();
            });
        });

        describe(@"when add bar button is pressed", ^{
            __block StreamItemCreator *itemCreatorMock;

            beforeEach(^{
                itemCreatorMock = mock([StreamItemCreator class]);
                photoStreamViewController.streamItemCreator = itemCreatorMock;

                UIBarButtonItem *barButtonItem = photoStreamViewController.navigationItem.rightBarButtonItem;
                [photoStreamViewController performSelector:barButtonItem.action];
            });
            it(@"should create stream item", ^{
                [verify(itemCreatorMock) createStreamItem];
            });
        });

    });
SPEC_END