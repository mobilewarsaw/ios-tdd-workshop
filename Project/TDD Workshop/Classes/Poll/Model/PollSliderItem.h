#import <Foundation/Foundation.h>


@interface PollSliderItem : NSObject
@property(nonatomic, readonly) NSString *title;
@property(nonatomic, readonly) NSNumber *value;

+ (instancetype)valueWithTitle:(NSString *)title value:(NSNumber *)value;
- (instancetype)initWithTitle:(NSString *)title value:(NSNumber *)value;

@end
