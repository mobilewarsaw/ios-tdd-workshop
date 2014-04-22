#import <Foundation/Foundation.h>
#import "AgendaItem.h"


@interface AgendaManager : NSObject
@property(nonatomic, readonly) NSString *title;
@property(nonatomic, readonly) NSArray *agendaItems;

+ (instancetype)sharedInstance;
- (UIColor *)colorForType:(AgendaItemType)type;
@end
