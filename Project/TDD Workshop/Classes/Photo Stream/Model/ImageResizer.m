//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "ImageResizer.h"
#import "UIImage+Resize.h"


@implementation ImageResizer

#pragma mark - Public methods

- (UIImage *)resizeImage:(UIImage *)image toBoundBothDimensionsTo:(CGFloat)maxImageDimension {
    CGSize resizedImageSize = [self scaledSizeFromSize:image.size forMaxDimension:maxImageDimension];
    return [image resizedImageToSize:resizedImageSize];
}

#pragma mark - Scaling methods

- (CGSize)scaledSizeFromSize:(CGSize)size forMaxDimension:(CGFloat)maxDimension {
    size = CGSizeApplyAffineTransform(size, [self scaleTransformForSize:size
                                                       maximumForGreaterDimension:maxDimension]);
    size.width = roundf(size.width);
    size.height = roundf(size.height);
    return size;
}

- (CGAffineTransform) scaleTransformForSize:(CGSize)size maximumForGreaterDimension:(CGFloat)maxDimension {
    CGFloat scaleFactor = 1.0f;
    if (!CGSizeEqualToSize(size, CGSizeZero)) {
        scaleFactor = maxDimension / MAX(size.width, size.height);
    }
    return CGAffineTransformMakeScale(scaleFactor, scaleFactor);
}

@end