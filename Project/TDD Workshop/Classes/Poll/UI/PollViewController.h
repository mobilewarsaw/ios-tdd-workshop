#import <Foundation/Foundation.h>

@class PollManager;
@class AgendaProvider;

@interface PollViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate, UIAlertViewDelegate>
@property(nonatomic, readonly) PollManager *pollManager;
@property(nonatomic, readonly) AgendaProvider *agendaProvider;

- (instancetype)initWithPollManager:(PollManager *)pollManager agendaProvider:(AgendaProvider *)agendaProvider;

- (void)configureRightNavigationItem:(BOOL)isPollCompleted;
@end
