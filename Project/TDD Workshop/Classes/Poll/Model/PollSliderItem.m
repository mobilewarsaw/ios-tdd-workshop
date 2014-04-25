#import "PollSliderItem.h"


@implementation PollSliderItem {

}

+ (instancetype)valueWithTitle:(NSString *)title value:(NSNumber *)value {
    return [[self alloc] initWithTitle:title value:value];
}

- (instancetype)initWithTitle:(NSString *)title value:(NSNumber *)value {
    self = [super init];
    if (self) {
        _title = title;
        _value = value;
    }

    return self;
}

@end
