//
//  UILabel+String.h
//  Bobbyen
//

#import <UIKit/UIKit.h>

@interface UILabel (String)

/**
 设置文本,并指定行间距
 
 @param text 文本内容
 @param lineSpacing 行间距
 */
-(void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;


+ (instancetype)labelWithFontSize:(CGFloat)size textColorHexStr:(NSString*)colorHexStr textContent:(NSString *)textContent;

@end
