#import <Foundation/Foundation.h>
#import "PollManager.h"


@interface FakePollManager : PollManager

- (void)setPollCompletedFlag:(BOOL)pollCompleted;
@end
