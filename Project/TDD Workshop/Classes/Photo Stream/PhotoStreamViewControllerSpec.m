#import "Specs.h"
#import "PhotoStreamViewController.h"
#import "StreamItemUploader.h"
#import "StreamItem.h"
#import "StreamItemCreator.h"

SPEC_BEGIN(PhotoStreamViewController)
    fdescribe(@"PhotoStreamViewController", ^{
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
            __block StreamItemUploader *itemUploaderMock;
            __block StreamItemCreator *itemCreatorMock;
            __block StreamItem *testStreamItem;
            beforeEach(^{
                testStreamItem = [StreamItem item];
                UIImage *testImage = [UIImage imageNamed:@"PhotoStream"];
                testStreamItem.data = UIImagePNGRepresentation(testImage);

                itemUploaderMock = mock([StreamItemUploader class]);
                photoStreamViewController.streamItemUploader = itemUploaderMock;

                itemCreatorMock = mock([StreamItemCreator class]);
                [given([itemCreatorMock createStreamItem]) willReturn:testStreamItem];
                photoStreamViewController.streamItemCreator = itemCreatorMock;

                UIBarButtonItem *barButtonItem = photoStreamViewController.navigationItem.rightBarButtonItem;
                [photoStreamViewController performSelector:barButtonItem.action];
            });
            it(@"should upload test photo", ^{
                [verify(itemUploaderMock) uploadStreamItem:testStreamItem];
            });
        });
    });
SPEC_END