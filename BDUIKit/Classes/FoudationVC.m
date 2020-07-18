//
//  FoudationVC.m
//  AFNetworking
//
//  Created by heng on 2020/7/18.
//

#import "FoudationVC.h"
#import <BDFoundation/NSArray+Safe.h>

@interface FoudationVC ()

@end

@implementation FoudationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor redColor];
    NSArray *array =[NSArray arrayWithObjects:@"123",@"234",@"abc",@"哈哈哈",@"hello",@"打到小日本",@"234",nil];
    for (int i = 0; i<array.count; i++) {
        NSString *str = [array safe_objectAtIndex:i];
        NSLog(@"数组安全处理后：%@",str);
    }
    
    
    
    // Do any additional setup after loading the view.
}

@end
