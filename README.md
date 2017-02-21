# PenTabbar
PanTabbar是一個簡單的iOS類,
可在想要有滑動效果的ViewController加入即可



"step 1"  - 讓你的UIViewController添加手勢
/*------------------------------------------------------------------------------------------------*/
#import "PanTabbar.h"
[self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector('your method')]];
/*------------------------------------------------------------------------------------------------*/




"step 2"  -  使用PanTabber 看你想要只能往左滑 或往右滑 或者是左右都可滑
/*------------------------------------------------------------------------------------------------*/
-(void)'your method':(UIPanGestureRecognizer*)recongizer{
[PanTabbar panRight:recongizer setTabbar:self.tabBarController setView:self.view];
}
/*------------------------------------------------------------------------------------------------*/




"step 3"  -   最後,增加滑動時的預覽圖
/*------------------------------------------------------------------------------------------------*/
-(void)viewDidAppear:(BOOL)animated{
[self.view addSubview:[PanTabbar createPanRight:self.tabBarController]];
}
/*------------------------------------------------------------------------------------------------*/




