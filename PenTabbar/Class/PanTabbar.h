//
//  PanTabbar.h
//  PenTabbar
//
//  Created by user on 2017/2/3.
//  Copyright © 2017年 HeartCoding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanTabbar : UIView

+(UIImageView*)createLeftImage: (UITabBarController*)tab;



/*createLeftIamge*/


+(UIImageView*)createRightImage: (UITabBarController*)tab;



/*createRightIamge*/



+(void)panRight:(UIPanGestureRecognizer*)recongizer setTabbar:(UITabBarController*)tabbar setView:(UIView*)view;


/*向右滑*/
/*create Right Gesture Recognizers*/



+(void)panLeft:(UIPanGestureRecognizer*)recongizer setTabbar:(UITabBarController*)tabbar setView:(UIView*)view;

/*向左滑*/
/*create Left Gesture Recognizers*/



+(void)panRightAndLeft:(UIPanGestureRecognizer*)recongizer setTabbar:(UITabBarController*)tabbar setView:(UIView*)view;


/*左右都可滑*/
/*create Left and Right Gesture Recognizers*/



@end
