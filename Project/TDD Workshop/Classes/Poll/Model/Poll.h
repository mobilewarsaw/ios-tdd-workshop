#import <Foundation/Foundation.h>


@interface Poll : NSObject
@property(nonatomic, readonly) NSString *fullName;
@property(nonatomic, readonly) NSString *email;
@property(nonatomic, readonly) NSString *additionalComment;
@property(nonatomic, readonly) NSNumber *generalFeelingValue;
@property(nonatomic, readonly) NSArray *agendaItemValues;

+ (instancetype)pollWithFullName:(NSString *)fullName email:(NSString *)email additionalComment:(NSString *)additionalComment generalFeelingValue:(NSNumber *)generalFeelingValue agendaItemValues:(NSArray *)agendaItemValues;
- (instancetype)initWithFullName:(NSString *)fullName email:(NSString *)email additionalComment:(NSString *)additionalComment generalFeelingValue:(NSNumber *)generalFeelingValue agendaItemValues:(NSArray *)agendaItemValues;

@end
