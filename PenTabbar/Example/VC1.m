//
//  VC1.m
//  PenTabbar
//
//  Created by user on 2017/2/3.
//  Copyright © 2017年 HeartCoding. All rights reserved.
//

#import "VC1.h"
#import "PanTabbar.h"
@interface VC1 ()

@end

@implementation VC1

-(void)viewDidAppear:(BOOL)animated{
    [self.view addSubview:[PanTabbar createRightImage:self.tabBarController]];
}
-(void)viewDidLoad {
    [super viewDidLoad];
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(addRightPan:)]];
}
-(void)addRightPan:(UIPanGestureRecognizer*)recongizer{
    [PanTabbar panRight:recongizer setTabbar:self.tabBarController setView:self.view];
}


@end
