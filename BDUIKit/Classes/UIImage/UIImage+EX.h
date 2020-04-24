//
//  UIImage+EX.h
//  headlineNews
//

#import <UIKit/UIKit.h>

@interface UIImage (EX)
//UIImage添加圆角
- (UIImage *)drawRectWithRoundedCorner:(CGFloat)radius size:(CGSize)size;

//截取指定区域图片
+ (UIImage *)cutoutFullScreen:(CGRect)screenFrame ImageSize:(CGSize)imageSize;

@end
