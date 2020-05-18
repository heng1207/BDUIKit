//
//  HighlightedLabel.h


#import <UIKit/UIKit.h>

/** 可指定范围高亮的 label */
@interface HighlightedLabel : UILabel

@property (nonatomic,assign) NSRange lightRange;///< 高亮的范围

@end
