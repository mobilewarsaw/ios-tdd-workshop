#import "Specs.h"

#import "PollViewController.h"
#import "FakePollAgendaProvider.h"
#import "FakePollManager.h"
#import "FakePollViewController.h"
#import "FakeViewValidatorFactory.h"
#import "SpecValidatorFixture.h"

SpecBegin(PollViewControllerSpec)

describe(@"PollViewController", ^{
    __block PollViewController *controller;
    __block AgendaProvider *agendaProvider;
    __block FakePollManager *pollManager;
    __block FakeViewValidatorFactory *validatorFactory;

    beforeEach(^{
        agendaProvider = [FakePollAgendaProvider new];
        pollManager = [FakePollManager new];
        validatorFactory = [FakeViewValidatorFactory new];
        controller = [[PollViewController alloc] initWithPollManager:pollManager
                                                      agendaProvider:agendaProvider
                                                    validatorFactory:validatorFactory];
    });

    afterEach(^{
        controller = nil;
    });

    describe(@"initialization", ^{

        it(@"should have agenda provider injected", ^{
            expect(controller.agendaProvider).to.equal(agendaProvider);
        });

        it(@"should have poll manager injected", ^{
            expect(controller.pollManager).to.equal(pollManager);
        });

        it(@"should set title", ^{
            expect(controller.title).to.equal(@"FixtureTitle");
        });

        it(@"should configure tab bar item", ^{
            expect(controller.tabBarItem.title).to.equal(@"FixtureTitle");
        });

    });

    describe(@"configuring navigation item", ^{
        __block UINavigationController *navigationController;

        beforeEach(^{
            navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
        });

        afterEach(^{
            navigationController = nil;
        });

        describe(@"first way", ^{
            beforeEach(^{
                [controller loadView];
                [controller viewDidLoad];
            });

            it(@"should set navigation item", ^{
                pollManager.pollCompletedFlag = NO;
                [controller viewWillAppear:NO];
                expect(controller.navigationItem.rightBarButtonItem).notTo.beNil();
            });

            it(@"should nil out navigation item", ^{
                pollManager.pollCompletedFlag = YES;
                [controller viewWillAppear:NO];
                expect(controller.navigationItem.rightBarButtonItem).to.beNil();
            });
        });

        describe(@"second way", ^{
            describe(@"navigation bar configuration", ^{
                it(@"should set navigation item", ^{
                    [controller configureRightNavigationItem:NO];
                    expect(controller.navigationItem.rightBarButtonItem).notTo.beNil();
                });

                it(@"should nil out navigation item", ^{
                    [controller configureRightNavigationItem:YES];
                    expect(controller.navigationItem.rightBarButtonItem).to.beNil();
                });
            });

            it(@"should configure navigation item in view will appear", ^{
                controller = [FakePollViewController new];
                [controller viewWillAppear:NO];
                expect([(FakePollViewController *)controller didCallConfigureRightNavigationItem]).to.beTruthy();
            });
        });

    });

    describe(@"validating in delegates", ^{
        __block SpecValidatorFixture *validator;

        beforeEach(^{
            validator = [SpecValidatorFixture new];
            validatorFactory.validator = validator;
        });

        it(@"should validate text for text field editing", ^{
            [controller textFieldDidEndEditing:nil];
            expect(validator.didCallValidateText).to.beTruthy();
        });

        it(@"should validate text for text view end editing", ^{
            [controller textViewDidEndEditing:nil];
            expect(validator.didCallValidateText).to.beTruthy();
        });

    });
});

SpecEnd
