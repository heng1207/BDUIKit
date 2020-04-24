//
//  UIImage+EX.m
//  headlineNews
//

#import "UIImage+EX.h"

@implementation UIImage (EX)

- (UIImage *)drawRectWithRoundedCorner:(CGFloat)radius size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, false, [UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:rect];
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



/**
 截取指定区域图片
 //你需要的区域起点,宽,高;
 */
+(UIImage *)cutoutFullScreen:(CGRect)screenFrame ImageSize:(CGSize)imageSize{
    
    UIWindow *screenWindow = [UIApplication sharedApplication].delegate.window;
    
    UIGraphicsBeginImageContext(screenWindow.frame.size);//全屏截图，包括window
    
    [screenWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage =UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImage * image = [UIImage imageWithCGImage:CGImageCreateWithImageInRect([viewImage CGImage], screenFrame)];
    
    image = [self compressOriginalImage:image toSize:imageSize];
    
    return image;
    
}

/**
 * 压缩图片到指定尺寸大小
 *
 * @param image 原始图片
 * @param size 目标大小
 *
 * @return 生成图片
 */
+(UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size{
    UIImage * resultImage = image;
    UIGraphicsBeginImageContext(size);
    [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIGraphicsEndImageContext();
    return image;
}


@end
