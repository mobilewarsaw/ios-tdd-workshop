#import <Foundation/Foundation.h>
#import "AgendaProvider.h"

@interface AgendaProvider (SharedInstance)
+ (instancetype)sharedInstance;
@end
