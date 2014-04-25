#import <Foundation/Foundation.h>

@class PollTextField;
@class PollSlider;
@class PollTextView;

@interface PollView : UIScrollView
@property(nonatomic, readonly) PollTextField *nameField;
@property(nonatomic, readonly) PollTextField *emailField;
@property(nonatomic, readonly) PollSlider *generalSlider;
@property(nonatomic, readonly) NSArray *agendaSliders;
@property(nonatomic, readonly) PollTextView *commentsView;
@property(nonatomic, readonly) UILabel *completedPollLabel;

- (id)initWithAgendaItem:(NSArray *)agendaItems;

- (void)setPollCompleted:(BOOL)completed;
@end
