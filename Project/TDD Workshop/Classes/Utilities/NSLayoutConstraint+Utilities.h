#import <Foundation/Foundation.h>

@interface NSLayoutConstraint (Utilities)
+ (NSArray *)constraintsWithVisualFormatArray:(NSArray *)formatArray options:(NSLayoutFormatOptions)opts metrics:(NSDictionary *)metrics views:(NSDictionary *)views;
@end
