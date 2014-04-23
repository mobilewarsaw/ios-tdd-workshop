//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import <Foundation/Foundation.h>

@class StreamItem;
@protocol StreamItemCreatorDelegate;
@class ImageResizer;

@interface StreamItemCreator : NSObject <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>
@property(nonatomic, weak) id <StreamItemCreatorDelegate> delegate;
- (instancetype)initWithDelegate:(id <StreamItemCreatorDelegate>)delegate;
+ (instancetype)creatorWithDelegate:(id <StreamItemCreatorDelegate>)delegate;


- (void)createStreamItem;

@end

@protocol StreamItemCreatorDelegate <NSObject>
@required
- (void)streamItemCreator:(StreamItemCreator *)streamItemCreator didCreateItem:(StreamItem *)streamItem;

- (UIViewController *)viewControllerToPresentOnImagePickerForStreamItemCreator:(StreamItemCreator *)streamItemCreator;
- (UITabBar *)tabBarToPresentOnImagePickOptionsForStreamItemCreator:(StreamItemCreator *)streamItemCreator;
@end