#import <Foundation/Foundation.h>
#import "ViewValidatorFactory.h"

@class SpecValidatorFixture;

@interface FakeViewValidatorFactory : ViewValidatorFactory
@property(nonatomic, strong) SpecValidatorFixture *validator;
@end
