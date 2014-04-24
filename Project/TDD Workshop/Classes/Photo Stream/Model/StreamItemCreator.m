//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "StreamItemCreator.h"
#import "StreamItem.h"
#import "ImageResizer.h"

@interface StreamItemCreator ()
@property(nonatomic, strong) ImageResizer *imageResizer;
@property(nonatomic, assign) CGFloat maxImageDimension;
@property(nonatomic, assign) CGFloat imageQuality;
@end

@implementation StreamItemCreator

#pragma mark - Object life cycle

- (instancetype)initWithDelegate:(id <StreamItemCreatorDelegate>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.imageResizer = [ImageResizer new];
        self.imageQuality = 0.7f;
        self.maxImageDimension = 300.0f;
    }
    return self;
}

+ (instancetype)creatorWithDelegate:(id <StreamItemCreatorDelegate>)delegate {
    return [[self alloc] initWithDelegate:delegate];
}

#pragma mark - Public methods

- (void)createStreamItem {
    [self presentImagePickerOptionsActionSheet];
}

#pragma mark - Image picker

- (void)presentImagePickerWithSourceType:(UIImagePickerControllerSourceType)sourceType {
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = sourceType;
        picker.delegate = self;
        UIViewController *viewController = [self.delegate viewControllerToPresentOnImagePickerForStreamItemCreator:self];
        [viewController presentViewController:picker animated:YES completion:NULL];
    }
}

#pragma mark - Action sheet

- (void)presentImagePickerOptionsActionSheet {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithFrame:CGRectZero];
    actionSheet.delegate = self;
    [self setupActionSheetButtons:actionSheet];
    UITabBar *tabBar = [self.delegate tabBarToPresentOnImagePickOptionsForStreamItemCreator:self];
    [actionSheet showFromTabBar:tabBar];
}

- (void)setupActionSheetButtons:(UIActionSheet *)actionSheet {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        [actionSheet addButtonWithTitle:@"Pick from library"];
    }
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [actionSheet addButtonWithTitle:@"Take a photo"];
    }
    [actionSheet addButtonWithTitle:@"Cancel"];
    [actionSheet setCancelButtonIndex:actionSheet.numberOfButtons - 1];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            [self presentImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            break;
        case 1:
            [self presentImagePickerWithSourceType:UIImagePickerControllerSourceTypeCamera];
            break;
        default:
            break;
    }
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *pickedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImage *resizedImage = [self.imageResizer resizeImage:pickedImage toBoundBothDimensionsTo:self.maxImageDimension];
    StreamItem *streamItem = [StreamItem new];
    streamItem.title = @"DEBUG";
    streamItem.data = UIImageJPEGRepresentation(resizedImage, self.imageQuality);
//    NSLog(@"image size:[%@]",[NSByteCountFormatter stringFromByteCount:streamItem.data.length countStyle:NSByteCountFormatterCountStyleFile]);
    streamItem.size = resizedImage.size;
    [self.delegate streamItemCreator:self didCreateItem:streamItem];
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end