//
//  VC3.m
//  PenTabbar
//
//  Created by user on 2017/2/3.
//  Copyright © 2017年 HeartCoding. All rights reserved.
//

#import "VC3.h"
#import "PanTabbar.h"
@interface VC3 ()

@end

@implementation VC3
-(void) viewDidAppear:(BOOL)animated{
    
    [self.view addSubview:[PanTabbar createLeftImage:self.tabBarController]];
    [self.view addSubview:[PanTabbar createRightImage:self.tabBarController]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
   [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(addRightAndLeftPan:)]];
}
- (void)addRightAndLeftPan:(UIPanGestureRecognizer*)recongizer{
    [PanTabbar panRightAndLeft:recongizer setTabbar:self.tabBarController setView:self.view];
}

@end
