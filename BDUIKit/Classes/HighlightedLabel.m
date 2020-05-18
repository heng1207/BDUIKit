//
//  HighlightedLabel.m


#import "HighlightedLabel.h"

#import <CoreText/CoreText.h>

// evaluate whether a string is empty.
#define __isStrNotEmpty(string) (   string                                  \
                                 && ![string isEqual:[NSNull null]]         \
                                 && [string isKindOfClass:[NSString class]] \
                                 && ![string isEqualToString:@"(null)"])
#define __isStrEmpty(string) !(__isStrNotEmpty(string))


@implementation HighlightedLabel

- (void)drawRect:(CGRect)rect{
    if (__isStrEmpty(self.text)) {
        [super drawRect:rect];
        return;
    }
    NSMutableAttributedString *sugText = [[NSMutableAttributedString alloc] initWithString:self.text];
    CTFontRef fontRef = CTFontCreateWithName((__bridge CFStringRef)self.font.fontName, self.font.pointSize, NULL);
    CGColorRef lightColor = self.highlightedTextColor.CGColor;
    CGColorRef textColor = self.textColor.CGColor;
    
    // 样式设置
    [sugText addAttribute:(id)kCTFontAttributeName value:(__bridge id)fontRef range:NSMakeRange(0, sugText.length)];
    NSRange leftRange = NSMakeRange(0, _lightRange.location);
    NSUInteger maxPosition = _lightRange.location + _lightRange.length;
    if(maxPosition>sugText.length)
    {
        [super drawRect:rect];
        return;
    }
    NSRange rightRange = NSMakeRange(maxPosition, sugText.length - maxPosition);
    [sugText addAttribute:(id)kCTForegroundColorAttributeName value:(__bridge id)(textColor) range:leftRange];
    [sugText addAttribute:(id)kCTForegroundColorAttributeName value:(__bridge id)(lightColor) range:_lightRange];
    [sugText addAttribute:(id)kCTForegroundColorAttributeName value:(__bridge id)(textColor) range:rightRange];
    
    CTParagraphStyleSetting textAlignment;
    CTTextAlignment alignment = kCTTextAlignmentLeft;
    textAlignment.spec = kCTParagraphStyleSpecifierAlignment;
    textAlignment.valueSize = sizeof(CTTextAlignment);
    textAlignment.value = &alignment;
    
    CTParagraphStyleSetting lineBreakMode;
    CTLineBreakMode lineBreak = kCTLineBreakByTruncatingTail;
    lineBreakMode.spec = kCTParagraphStyleSpecifierLineBreakMode;
    lineBreakMode.value = &lineBreak;
    lineBreakMode.valueSize = sizeof(CTLineBreakMode);
    
    CTParagraphStyleSetting settings[] = {textAlignment,lineBreakMode};
    CTParagraphStyleRef style = CTParagraphStyleCreate(settings, 2);
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithObject:(__bridge id)style forKey:(id)kCTParagraphStyleAttributeName ];
    [sugText addAttributes:attributes range:NSMakeRange(0, self.text.length)];
    
    // 开始绘制
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)sugText);
    CFRange fitRange;// 显示的 string 范围
    CGSize size = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), NULL, rect.size, &fitRange);
    CGMutablePathRef Path = CGPathCreateMutable();
    // --- 垂直居中显示
    CGPathAddRect(Path, NULL ,CGRectMake(0, (CGRectGetHeight(rect)-size.height)/2., size.width, size.height));
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), Path, NULL);
    
    // 摆正坐标系
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, CGRectGetHeight(rect));
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSaveGState(context);
    
    CTFrameDraw(frame,context);
    
    CGPathRelease(Path);
    CFRelease(framesetter);
    CGContextRestoreGState(context);
    
}

- (void)setLightRange:(NSRange)lightRange{
    if (lightRange.location == NSNotFound) {
        _lightRange = NSMakeRange(0, 0);
    }else{
        _lightRange = lightRange;
    }
    [self setNeedsDisplay];
}

@end
