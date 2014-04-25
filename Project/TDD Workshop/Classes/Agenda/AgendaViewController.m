//
//  TDD Workshop
//
//  Created by Lukasz Warchol on 22/04/14.
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//

#import "AgendaViewController.h"


@implementation AgendaViewController

- (id)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"agenda"];
    }
    return self;
}

@end
