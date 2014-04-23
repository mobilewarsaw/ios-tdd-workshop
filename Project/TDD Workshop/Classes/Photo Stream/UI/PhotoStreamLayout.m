//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "PhotoStreamLayout.h"


@implementation PhotoStreamLayout

#pragma mark - Object life cycle

- (id)init {
    self = [super init];
    if (self) {
        self.sectionInset = UIEdgeInsetsMake(8.0f, 0.0f, 8.0f, 0.0f);
        self.minimumInteritemSpacing = 4.0f;
        self.minimumLineSpacing = 4.0f;
        self.itemSize = CGSizeMake(77.0f, 77.0f);
    }
    return self;
}

@end