//
//  UITableViewExt.h
//  VideoIphone
//

#import <UIKit/UIKit.h>

/**
主要为了解决UITableView section header和 section footer自动粘连的问题，
*/
@interface UITableViewExt : UITableView

@property (nonatomic,assign) BOOL shouldDisableHeaderViewsToFloat;//表示是否禁用section header的自动粘连
@property (nonatomic,assign) BOOL shouldDisableFooterViewsToFloat;//表示是否禁用section footer的自动粘连

@end
