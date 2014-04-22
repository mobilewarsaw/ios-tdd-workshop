#import "AgendaItem.h"


@implementation AgendaItem {

}

+ (instancetype)itemWithTitle:(NSString *)title type:(AgendaItemType)type startDate:(NSDate *)startDate duration:(NSTimeInterval)duration speakers:(NSArray *)speakers {
    return [[self alloc] initWithTitle:title type:type startDate:startDate duration:duration speakers:speakers];
}

- (instancetype)initWithTitle:(NSString *)title type:(AgendaItemType)type startDate:(NSDate *)startDate duration:(NSTimeInterval)duration speakers:(NSArray *)speakers {
    self = [super init];
    if (self) {
        _title = title;
        _type = type;
        _startDate = startDate;
        _duration = duration;
        _speakers = speakers;
    }

    return self;
}

@end
