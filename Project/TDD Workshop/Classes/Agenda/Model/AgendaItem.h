//
//  TDD Workshop
//
//  Created by Lukasz Warchol on 22/04/14.
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//


#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AgendaItemType) {
    AgendaItemTypeUnknown = 0,
    AgendaItemTypeBreak = 1,
    AgendaItemTypeLecture = 2,
    AgendaItemTypeWorkshop = 3
};

@interface AgendaItem : NSObject
@property(nonatomic, readonly) NSString *title;
@property(nonatomic, readonly) AgendaItemType type;
@property(nonatomic, readonly) NSDate *startDate;
@property(nonatomic, readonly) NSTimeInterval duration;
@property(nonatomic, readonly) NSArray *speakers;

+ (instancetype)itemWithTitle:(NSString *)title
                         type:(AgendaItemType)type
                    startDate:(NSDate *)startDate
                     duration:(NSTimeInterval)duration
                     speakers:(NSArray *)speakers;

- (instancetype)initWithTitle:(NSString *)title
                         type:(AgendaItemType)type
                    startDate:(NSDate *)startDate
                     duration:(NSTimeInterval)duration
                     speakers:(NSArray *)speakers;

@end
