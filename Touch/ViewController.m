//
//  ViewController.m
//  Touch
//
//  Created by Steven on 15/12/4.
//  Copyright © 2015年 Steven. All rights reserved.
//

#import "ViewController.h"
#import "PicCollectionViewCell.h"
#import "ContentViewController.h"
@interface ViewController ()<UIViewControllerPreviewingDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *arrPic;
@property (nonatomic, strong) NSMutableArray *arrName;
@end

@implementation ViewController

- (void)handleData {
    self.arrPic = [NSMutableArray array];
    self.arrName = [NSMutableArray array];
    for (int i = 1; i < 27; i ++) {
        [self.arrPic addObject:[NSString stringWithFormat:@"%d", i]];
        [self.arrName addObject:[NSString stringWithFormat:@"%c", i + 64]];
    }
}

- (void)createCollectionView {
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    /* API */
    /* item 大小 */
    flow.itemSize = CGSizeMake(100, 100);
    /* 行间的最小间距 */
    flow.minimumLineSpacing = 5.0f;
    flow.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    /* 创建collectionView对象 */
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) collectionViewLayout:flow];
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    /* 两个协议 */
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[PicCollectionViewCell class] forCellWithReuseIdentifier:@"pic"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrPic.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PicCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pic" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.name = [self.arrPic objectAtIndex:indexPath.row];
    return cell;
}


#pragma mark - 按压图片进入预览模式
- (UIViewController * _Nullable)previewingContext:(id<UIViewControllerPreviewing> _Nonnull)previewingContext viewControllerForLocation:(CGPoint)location {
    ContentViewController *content = [[ContentViewController alloc] init];
    NSIndexPath *index = [self.collectionView indexPathForItemAtPoint:CGPointMake(location.x, location.y - 64 + self.collectionView.contentOffset.y)];
    if (index == NULL) {
        return nil;
    } else {
        content.name = [self.arrPic objectAtIndex:index.item];
        content.picName = [self.arrName objectAtIndex:index.item];
        return content;
    }
}
#pragma mark - 继续按压进入查看图片
- (void)previewingContext:(id<UIViewControllerPreviewing> _Nonnull)previewingContext commitViewController:(UIViewController * _Nonnull)viewControllerToCommit
{
    viewControllerToCommit.view.backgroundColor = [UIColor whiteColor];
    [self showViewController:viewControllerToCommit sender:self];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Picture";
    // 注册预览视图的代理和来源视图
    [self registerForPreviewingWithDelegate:(id)self sourceView:self.view];
    // 数据加载
    [self handleData];
    // 创建collectView, 用于测试3D Touch的效果
    [self createCollectionView];
    // 设置不自动偏移
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    // 设置3D Touch 的标签(实现方式:代码和plist文件设置)
    UIApplicationShortcutItem * item = [[UIApplicationShortcutItem alloc]initWithType:@"two" localizedTitle:@"标签2" localizedSubtitle:@"222" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove] userInfo:nil];
    // 设置自定义标签图片
    UIApplicationShortcutItem * itemTwo = [[UIApplicationShortcutItem alloc]initWithType:@"two" localizedTitle:@"标签3" localizedSubtitle:@"333" icon:[UIApplicationShortcutIcon iconWithTemplateImageName:@"jieri"] userInfo:nil];
    UIApplicationShortcutItem * itemThird = [[UIApplicationShortcutItem alloc]initWithType:@"two" localizedTitle:@"标签4" localizedSubtitle:@"444" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch] userInfo:nil];   [UIApplication sharedApplication].shortcutItems = @[item, itemTwo, itemThird];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
