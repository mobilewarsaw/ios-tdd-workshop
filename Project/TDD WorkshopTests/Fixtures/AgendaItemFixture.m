//
// Copyright 2014 Taptera Inc. All rights reserved.
//


#import "AgendaItemFixture.h"

const NSInteger HalfAnHour = 30 * 60;

@implementation AgendaItemFixture

- (id)init {
    self = [super init];
    if (self) {
        self.title = @"Spec Session";
        self.type = AgendaItemTypeWorkshop;
        self.duration = HalfAnHour;
        self.startDate = [NSDate dateWithTimeIntervalSince1970:0];
        self.speakers = @[@"Bill Gates"];
    }
    return self;
}

@end
