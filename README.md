# 3D-Touch 练习Demo

3D Touch的触控技术，被苹果称为新一代多点触控技术。其实，就是此前在Apple Watch上采用的Force Touch，屏幕可感应不同的感压力度触控3D Touch，苹果iPhone 6s的新功能，看起来类似 PC 上的右键。有Peek Pop 两种新手势。

使用 CollectionView + 3D Touch 简单尝鲜~

#### 主要功能代码
```Objectiv-C
// 在 AppDelegate 中实现
// 用来处理 3D Touch 触发事件
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler{
    //判断先前我们设置的唯一标识
    if([shortcutItem.localizedTitle isEqualToString:@"标签1"]){
        NSArray *arr = @[@"hello 3D Touch"];
        UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:arr applicationActivities:nil];
        //设置当前的VC 为rootVC
        [self.window.rootViewController presentViewController:vc animated:YES completion:^{
        }];
    }
    if ([shortcutItem.localizedTitle isEqual: @"标签2"]) {
        // 点击标签2时，显示提示框
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"OPPS!" message:@"啦啦啦" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alertC addAction:alert];
        [self.window.rootViewController presentViewController:alertC animated:YES completion:^{
        }];
        return;
    }
}
```

页面截图：

![ABC](https://raw.githubusercontent.com/ReverseScale/3D-Touch/master/8D712142-D657-4E2D-A475-393F9CD3BB5B.png) 
