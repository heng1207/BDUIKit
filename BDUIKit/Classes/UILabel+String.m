//
//  UILabel+String.m
//  Bobbyen
//

#import "UILabel+String.h"
#import "UIColor+Addition.h"


@implementation UILabel (String)

-(void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing {
    if (!text || lineSpacing < 0.01) {
        self.text = text;
        return;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //设置行间距
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    self.attributedText = attributedString;
}


+ (instancetype)labelWithFontSize:(CGFloat)size textColorHexStr:(NSString*)colorHexStr textContent:(NSString *)textContent
{
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;

    
    //富文本属性
    NSMutableDictionary *textDict = [NSMutableDictionary dictionary];
    //基本属性设置
    //字体颜色
    textDict[NSForegroundColorAttributeName] = [UIColor blackColor];
    //字号大小
    textDict[NSFontAttributeName] = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    
    //段落样式
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    //行间距
    paraStyle.lineSpacing = 10.0;
    //文本段落样式
    textDict[NSParagraphStyleAttributeName] = paraStyle;
    
    label.attributedText = [[NSAttributedString alloc] initWithString:textContent attributes:textDict];
    return label;
}


@end
