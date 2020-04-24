//
//  UIImage+WaterMask.h
//  BDUIKit
//

#import <UIKit/UIKit.h>

@interface UIImage (WaterMask)
//图片上添加水印（图片）
- (UIImage *) imageWithWaterMask:(UIImage*)mask inRect:(CGRect)rect;
//图片上添加水印（文字）
- (UIImage *)normalizedImageWithText:(NSString *)text;

@end
