#import "FakePollViewController.h"


@implementation FakePollViewController {

}

- (void)configureRightNavigationItem:(BOOL)isPollCompleted {
    self.didCallConfigureRightNavigationItem = YES;
}

@end
