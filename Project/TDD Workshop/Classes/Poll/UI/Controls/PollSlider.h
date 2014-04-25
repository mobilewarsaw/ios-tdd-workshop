#import <Foundation/Foundation.h>

@class SAMultisectorControl;

@interface PollSlider : UIView
@property(nonatomic, readonly) UILabel *titleLabel;
@property(nonatomic, readonly) SAMultisectorControl *multisectorControl;

+ (instancetype)fieldWithTitle:(NSString *)title color:(UIColor *)color;
- (instancetype)initWithTitle:(NSString *)title color:(UIColor *)color;

@end
