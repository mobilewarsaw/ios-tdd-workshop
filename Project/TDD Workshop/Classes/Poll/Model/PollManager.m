#import <Parse-iOS-SDK/PFObject.h>
#import "PollManager.h"
#import "Poll.h"
#import "PollSliderItem.h"

static NSString *kParsePollFullName = @"fullName";
static NSString *kParsePollEmail = @"email";
static NSString *kParsePollComment = @"comment";
static NSString *kParsePollSliderValuesReference = @"sliderValues";

static NSString *kParsePollSliderTitle = @"title";
static NSString *kParsePollSliderValue = @"value";

static NSString *kPollCompleted = @"kPollCompleted";

@interface PollManager ()
@property(nonatomic, readwrite, getter = isPollCompleted) BOOL pollCompleted;
@end

@implementation PollManager

+ (instancetype)sharedInstance {
    static PollManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [self new];
    });
    return sharedManager;
}

- (NSString *)title {
    return @"Poll";
}

- (void)sendPoll:(Poll *)poll completion:(void (^)(BOOL))completion {

    PFObject *pollObject = [PFObject objectWithClassName:NSStringFromClass([Poll class])];
    pollObject[kParsePollFullName] = poll.fullName;
    pollObject[kParsePollEmail] = poll.email;
    pollObject[kParsePollComment] = poll.additionalComment;

    NSMutableArray *parseObjects = [NSMutableArray array];
    for (PollSliderItem *itemValue in poll.agendaItemValues) {
        PFObject *sliderValueObject = [PFObject objectWithClassName:NSStringFromClass([PollSliderItem class])];
        sliderValueObject[kParsePollSliderTitle] = itemValue.title;
        sliderValueObject[kParsePollSliderValue] = itemValue.value;
        [parseObjects addObject:sliderValueObject];
    }
    pollObject[kParsePollSliderValuesReference] = parseObjects;

    __typeof(self) __weak weakSelf = self;
    [pollObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded && completion) {
            weakSelf.pollCompleted = YES;
            completion(succeeded);
        }
    }];
}

- (void)setPollCompleted:(BOOL)pollCompleted {
    [[self defaults] setObject:@(pollCompleted) forKey:kPollCompleted];
}

- (BOOL)isPollCompleted {
    return [[[self defaults] objectForKey:kPollCompleted] boolValue];
}

- (NSUserDefaults *)defaults {
    return [NSUserDefaults standardUserDefaults];
}

@end
