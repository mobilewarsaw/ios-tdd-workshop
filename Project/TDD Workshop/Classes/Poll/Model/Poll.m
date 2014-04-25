#import "Poll.h"


@implementation Poll {

}

+ (instancetype)pollWithFullName:(NSString *)fullName email:(NSString *)email additionalComment:(NSString *)additionalComment generalFeelingValue:(NSNumber *)generalFeelingValue agendaItemValues:(NSArray *)agendaItemValues {
    return [[self alloc] initWithFullName:fullName email:email additionalComment:additionalComment
                      generalFeelingValue:generalFeelingValue agendaItemValues:agendaItemValues];
}

- (instancetype)initWithFullName:(NSString *)fullName email:(NSString *)email additionalComment:(NSString *)additionalComment generalFeelingValue:(NSNumber *)generalFeelingValue agendaItemValues:(NSArray *)agendaItemValues {
    self = [super init];
    if (self) {
        _fullName = fullName;
        _email = email;
        _additionalComment = additionalComment;
        _generalFeelingValue = generalFeelingValue;
        _agendaItemValues = agendaItemValues;
    }

    return self;
}

@end
