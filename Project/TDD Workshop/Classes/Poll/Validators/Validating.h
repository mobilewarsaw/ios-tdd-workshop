#import <Foundation/Foundation.h>

@protocol Validating <NSObject>
- (BOOL)validateText:(NSString *)text;
@end
