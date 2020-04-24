//
//  UIImage+WaterMask.m
//  BDUIKit
//

#import "UIImage+WaterMask.h"

@implementation UIImage (WaterMask)

- (UIImage *) imageWithWaterMask:(UIImage*)mask inRect:(CGRect)rect{
    
    UIGraphicsBeginImageContextWithOptions([self size], NO, self.scale);
    //原图
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];

    //水印图
    [mask drawInRect:rect];
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newPic;
}

- (UIImage *)normalizedImageWithText:(NSString *)text {

    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    [self drawInRect:(CGRect){0, 0, self.size}];
    
    //绘制文字
    CGRect rect = CGRectMake(40, self.size.height - 40, 150, 40);
    //设置字体
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:30],
               NSForegroundColorAttributeName:[UIColor redColor]};
    [text drawInRect:rect withAttributes:dic];
    
    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}

@end
