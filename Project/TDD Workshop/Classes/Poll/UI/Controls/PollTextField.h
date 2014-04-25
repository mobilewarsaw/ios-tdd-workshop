#import <Foundation/Foundation.h>


@interface PollTextField : UIView
@property(nonatomic, readonly) UILabel *titleLabel;
@property(nonatomic, readonly) UITextField *textField;

+ (instancetype)fieldWithTitle:(NSString *)title;
- (instancetype)initWithTitle:(NSString *)title;

@end
