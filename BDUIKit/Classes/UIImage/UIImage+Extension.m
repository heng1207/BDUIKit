//
//  UIImage+Extension.m
//  BDUIKit
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

- (CGSize) realSize
{
    CGFloat fixelW = CGImageGetWidth(self.CGImage);
    CGFloat fixelH = CGImageGetHeight(self.CGImage);
    return CGSizeMake(fixelW, fixelH);
}
@end
