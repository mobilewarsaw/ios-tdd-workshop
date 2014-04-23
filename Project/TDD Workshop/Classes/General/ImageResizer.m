//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "ImageResizer.h"


@implementation ImageResizer

#pragma mark - Public methods

- (UIImage *)resizeImage:(UIImage *)image toBoundBothDimensionsTo:(CGFloat)maxImageDimension {
    CGSize newSize = [self scaledSizeFromSize:image.size forMaxDimension:maxImageDimension];
    return [self resizeImage:image toSize:newSize interpolationQuality:kCGInterpolationHigh];
}

#pragma mark - Private methods

- (UIImage *)resizeImage:(UIImage*)image
                  toSize:(CGSize)newSize
    interpolationQuality:(CGInterpolationQuality)quality {
    BOOL drawTransposed;
    switch (image.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            drawTransposed = YES;
            break;
        default:
            drawTransposed = NO;
    }
    return [self resizeImage:image
                      toSize:newSize
                   transform:[self transformForOrientation:newSize image:image]
              drawTransposed:drawTransposed
        interpolationQuality:quality];
}

- (UIImage *)resizeImage:(UIImage*)image
                  toSize:(CGSize)newSize
               transform:(CGAffineTransform)transform
          drawTransposed:(BOOL)transpose
    interpolationQuality:(CGInterpolationQuality)quality {
    CGRect newRect = CGRectIntegral(CGRectMake(0, 0, newSize.width, newSize.height));
    CGRect transposedRect = CGRectMake(0, 0, newRect.size.height, newRect.size.width);
    CGImageRef imageRef = image.CGImage;
    CGContextRef bitmap = CGBitmapContextCreate(NULL,
        (size_t) newRect.size.width,
        (size_t) newRect.size.height,
        CGImageGetBitsPerComponent(imageRef),
        0,
        CGImageGetColorSpace(imageRef),
        CGImageGetBitmapInfo(imageRef));
    CGContextConcatCTM(bitmap, transform);
    CGContextSetInterpolationQuality(bitmap, quality);
    CGContextDrawImage(bitmap, transpose ? transposedRect : newRect, imageRef);
    CGImageRef newImageRef = CGBitmapContextCreateImage(bitmap);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    CGContextRelease(bitmap);
    CGImageRelease(newImageRef);
    return newImage;
}

- (CGAffineTransform)transformForOrientation:(CGSize)newSize image:(UIImage*)image {
    CGAffineTransform transform = CGAffineTransformIdentity;
    switch (image.imageOrientation) {
        case UIImageOrientationDown:           // EXIF = 3
        case UIImageOrientationDownMirrored:   // EXIF = 4
            transform = CGAffineTransformTranslate(transform, newSize.width, newSize.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
        case UIImageOrientationLeft:           // EXIF = 6
        case UIImageOrientationLeftMirrored:   // EXIF = 5
            transform = CGAffineTransformTranslate(transform, newSize.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
        case UIImageOrientationRight:          // EXIF = 8
        case UIImageOrientationRightMirrored:  // EXIF = 7
            transform = CGAffineTransformTranslate(transform, 0, newSize.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    switch (image.imageOrientation) {
        case UIImageOrientationUpMirrored:     // EXIF = 2
        case UIImageOrientationDownMirrored:   // EXIF = 4
            transform = CGAffineTransformTranslate(transform, newSize.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationLeftMirrored:   // EXIF = 5
        case UIImageOrientationRightMirrored:  // EXIF = 7
            transform = CGAffineTransformTranslate(transform, newSize.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    return transform;
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