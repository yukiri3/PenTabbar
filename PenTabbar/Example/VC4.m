//
//  VC4.m
//  PenTabbar
//
//  Created by user on 2017/2/3.
//  Copyright © 2017年 HeartCoding. All rights reserved.
//

#import "VC4.h"
#import "PanTabbar.h"
@interface VC4 ()

@end

@implementation VC4
-(void)viewDidAppear:(BOOL)animated{
    
    [self.view addSubview:[PanTabbar createLeftImage:self.tabBarController]];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(addLeftPan:)]];
}
- (void)addLeftPan:(UIPanGestureRecognizer*)recongizer{
    [PanTabbar panLeft:recongizer setTabbar:self.tabBarController setView:self.view];
}



@end
