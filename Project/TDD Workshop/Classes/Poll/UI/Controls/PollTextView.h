#import <Foundation/Foundation.h>


@interface PollTextView : UIView
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UITextView *textView;
- (instancetype)initWithTitle:(NSString *)title;
+ (instancetype)fieldWithTitle:(NSString *)title;
@end
