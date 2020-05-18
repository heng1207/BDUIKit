//
//  UITableViewExt.m
//  VideoIphone
//

#import "UITableViewExt.h"
#import <objc/runtime.h>

@implementation UITableViewExt

+(void)load
{
    [self replaceInstanceOldMethodSel:NSSelectorFromString(@"allowsHeaderViewsToFloat") withNewMethodSel:@selector(myCustomAllowsHeaderViewsToFloat)];
    [self replaceInstanceOldMethodSel:NSSelectorFromString(@"allowsFooterViewsToFloat") withNewMethodSel:@selector(myCustomAllowsFooterViewsToFloat)];
}

+(void)replaceInstanceOldMethodSel:(SEL)oldSel withNewMethodSel:(SEL)newSel
{
    Method me=class_getInstanceMethod([self class], newSel);
    if(!me)
    {
        return;
    }
    class_replaceMethod([self class],oldSel,method_getImplementation(me),method_getTypeEncoding(me));
}

-(BOOL)myCustomAllowsHeaderViewsToFloat
{
    return !_shouldDisableHeaderViewsToFloat;
}

- (BOOL) myCustomAllowsFooterViewsToFloat
{
    return !_shouldDisableFooterViewsToFloat;
}
@end
