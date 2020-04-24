//
//  UIColor+Addition.h
//  LianTuojipiao
//

#import <UIKit/UIKit.h>

@interface UIColor (Addition)

+ (UIColor *)colorWithHex:(NSString *)hexColor;

//绘制渐变色颜色的方法
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;
@end
