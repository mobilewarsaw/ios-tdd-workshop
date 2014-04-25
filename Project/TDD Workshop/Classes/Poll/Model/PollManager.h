#import <Foundation/Foundation.h>

@class Poll;

@interface PollManager : NSObject
@property(nonatomic, readonly) NSString *title;
@property(nonatomic, readonly, getter = isPollCompleted) BOOL pollCompleted;

+ (instancetype)sharedInstance;

- (void)sendPoll:(Poll *)poll completion:(void (^)(BOOL succeeded))completion;
@end
