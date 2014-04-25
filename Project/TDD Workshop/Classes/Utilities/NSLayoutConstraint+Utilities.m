#import "NSLayoutConstraint+Utilities.h"


@implementation NSLayoutConstraint (Utilities)

+ (NSArray *)constraintsWithVisualFormatArray:(NSArray *)formatArray
                                      options:(NSLayoutFormatOptions)opts
                                      metrics:(NSDictionary *)metrics
                                        views:(NSDictionary *)views {

    NSMutableArray *constraints = [NSMutableArray array];

    for (NSString *format in formatArray) {
        if ([format length] == 0) continue;
        NSArray *subConstraints = [NSLayoutConstraint constraintsWithVisualFormat:format
                                                                          options:opts
                                                                          metrics:metrics
                                                                            views:views];

        [constraints addObjectsFromArray:subConstraints];
    }

    return constraints;
}

@end
