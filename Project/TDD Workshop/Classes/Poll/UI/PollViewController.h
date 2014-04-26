#import <Foundation/Foundation.h>

@class PollManager;
@class AgendaProvider;
@class ViewValidatorFactory;

@interface PollViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate, UIAlertViewDelegate>
@property(nonatomic, readonly) PollManager *pollManager;
@property(nonatomic, readonly) AgendaProvider *agendaProvider;
@property(nonatomic, readonly) ViewValidatorFactory *validatorFactory;

- (instancetype)initWithPollManager:(PollManager *)pollManager
                     agendaProvider:(AgendaProvider *)agendaProvider
                   validatorFactory:(ViewValidatorFactory *)validatorFactory;

- (void)configureRightNavigationItem:(BOOL)isPollCompleted;
@end
