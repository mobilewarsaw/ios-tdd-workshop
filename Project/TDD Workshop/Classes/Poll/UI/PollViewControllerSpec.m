#import "Specs.h"

#import "PollViewController.h"
#import "FakePollAgendaProvider.h"
#import "FakePollManager.h"
#import "FakePollViewController.h"

SpecBegin(PollViewControllerSpec)

describe(@"PollViewController", ^{
    __block PollViewController *controller;
    __block FakePollAgendaProvider *agendaProvider;
    __block FakePollManager *pollManager;

    beforeEach(^{
        agendaProvider = [FakePollAgendaProvider new];
        pollManager = [FakePollManager new];
        controller = [[PollViewController alloc] initWithPollManager:pollManager
                                                      agendaProvider:agendaProvider];
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
            it(@"should set navigation item", ^{
                pollManager.pollCompletedFlag = NO;
                [controller loadView];
                [controller viewDidLoad];
                [controller viewWillAppear:NO];
                expect(controller.navigationItem.rightBarButtonItem).notTo.beNil();
            });

            it(@"should nil out navigation item", ^{
                pollManager.pollCompletedFlag = YES;
                [controller loadView];
                [controller viewDidLoad];
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
});

SpecEnd
