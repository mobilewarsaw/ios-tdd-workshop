#import "AgendaProvider+SharedInstance.h"


@implementation AgendaProvider (SharedInstance)

+ (instancetype)sharedInstance {
    static AgendaProvider *provider = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        provider = [[self alloc] init];
    });
    return provider;
}

@end
