//
//  UIBarButtonItem+GFBarButtonItem.h
//  GFSinaWeiBo
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (GFBarButtonItem)

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;


@end
