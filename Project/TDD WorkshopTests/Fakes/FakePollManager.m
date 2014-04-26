#import "FakePollManager.h"


@implementation FakePollManager {
    BOOL _pollCompleted;
}

- (NSString *)title {
    return @"FixtureTitle";
}

- (void)setPollCompletedFlag:(BOOL)pollCompleted {
    _pollCompleted = pollCompleted;
}

- (BOOL)isPollCompleted {
    return _pollCompleted;
}


@end
