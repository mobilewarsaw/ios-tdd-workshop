#import "AgendaManager.h"
#import "Speaker.h"
#import "AgendaItem.h"


@implementation AgendaManager {

}

+ (instancetype)sharedInstance {
    static AgendaManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [self new];
    });
    return sharedManager;
}

- (id)init {
    self = [super init];
    if (self) {
        _agendaItems = [self initialAgenda];
        _title = @"Agenda";
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
            Speaker *speaker = [[Speaker alloc] initWithName:JSONSpeakerName];
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

- (UIColor *)colorForType:(AgendaItemType)type {
    NSDictionary *colors = @{
            @(AgendaItemTypeUnknown) : [UIColor grayColor],
            @(AgendaItemTypeBreak) : [UIColor greenColor],
            @(AgendaItemTypeLecture) : [UIColor yellowColor],
            @(AgendaItemTypeWorkshop) : [UIColor blueColor],
    };
    return colors[@(type)];
}

@end
