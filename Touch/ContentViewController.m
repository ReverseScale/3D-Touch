//
//  ContentViewController.m
//  Touch
//
//  Created by Camille on 15/12/5.
//  Copyright © 2015年 Camille. All rights reserved.
//

#import "ContentViewController.h"
@interface ContentViewController ()
@property (nonatomic, strong) UIAlertController *alertC;
@end
@implementation ContentViewController
// 设置预览视图向上滑动时出现的视图
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Action 1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        // 点击此选项触发
        self.alertC = [UIAlertController alertControllerWithTitle:@"你查看的是:" message:[NSString stringWithFormat:@"图片%@", self.picName] preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *alert = [UIAlertAction actionWithTitle:@"噢噢" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [self.alertC addAction:alert];
        // 因为预览视图与根视图不在一个视图层级上，所以需要通过根视图去推出这个
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:self.alertC animated:YES completion:^{
        }];
    }];
    // 可以添加多个选项
    NSArray *arr = @[action1];
    return arr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.picName;
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.name]];
    image.frame = CGRectMake(20, 0, self.view.frame.size.width - 40, self.view.frame.size.width - 40);
    image.center = CGPointMake(self.view.frame.size.width / 2, (self.view.frame.size.height - 64) / 2);
    [self.view addSubview:image];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
