#import <Foundation/Foundation.h>
#import "Validating.h"


@interface SpecValidatorFixture : NSObject <Validating>
@property(nonatomic) BOOL didCallValidateText;
@end
