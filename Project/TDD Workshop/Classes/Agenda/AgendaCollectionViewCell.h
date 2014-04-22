#import <Foundation/Foundation.h>

@class AgendaItem;

@interface AgendaCollectionViewCell : UICollectionViewCell
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *startDateLabel;
@property(nonatomic, strong) UILabel *durationLabel;
@property(nonatomic, strong) UIView *typeView;
@property(nonatomic, strong) UILabel *speakersLabel;

- (void)configureForAgendaItem:(AgendaItem *)item;
@end
