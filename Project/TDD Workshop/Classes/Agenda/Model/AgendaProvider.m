//
//  TDD Workshop
//
//  Created by Lukasz Warchol on 22/04/14.
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//


#import "AgendaProvider.h"
#import "Speaker.h"
#import "AgendaItem.h"


@implementation AgendaProvider

- (id)init {
    self = [super init];
    if (self) {
        _agendaItems = [self initialAgenda];
    }
    return self;
}

- (NSArray *)initialAgenda {
    NSString *speakersPath = [[NSBundle mainBundle] pathForResource:@"Agenda" ofType:@"JSON"];
    NSData *speakersData = [NSData dataWithContentsOfFile:speakersPath];
    NSArray *JSONAgendaItems = [NSJSONSerialization JSONObjectWithData:speakersData options:0 error:nil];

    NSMutableArray *agendaItems = [NSMutableArray array];

    for (NSDictionary *JSONAgendaItem in JSONAgendaItems) {
        NSMutableArray *speakers = [NSMutableArray array];
        for (NSString *JSONSpeakerName in JSONAgendaItem[@"speakers"]) {
            Speaker *speaker = [[Speaker alloc] initWithName:JSONSpeakerName photo:nil ];
            [speakers addObject:speaker];
        }

        AgendaItem *agendaItem = [AgendaItem itemWithTitle:JSONAgendaItem[@"title"]
                                                      type:(AgendaItemType) [JSONAgendaItem[@"type"] integerValue]
                                                 startDate:[NSDate dateWithTimeIntervalSince1970:[JSONAgendaItem[@"startDate"] doubleValue]]
                                                  duration:[JSONAgendaItem[@"duration"] doubleValue]
                                                  speakers:speakers];
        [agendaItems addObject:agendaItem];
    }

    return agendaItems;
}

@end
