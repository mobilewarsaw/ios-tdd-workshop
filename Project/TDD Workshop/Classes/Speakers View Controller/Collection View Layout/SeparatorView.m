/*
 * Copyright 2014 Taptera Inc. All rights reserved.
 */


#import "SeparatorView.h"
#import "UIColor+TDDWorkshop.h"


@implementation SeparatorView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor barsBackgroundTintColor];
    }

    return self;
}


@end
