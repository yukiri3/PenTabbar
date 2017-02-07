//
//  PanTabbar.m
//  PenTabbar
//
//  Created by user on 2017/2/3.
//  Copyright © 2017年 HeartCoding. All rights reserved.
//

#import "PanTabbar.h"

@implementation PanTabbar

+(UIImageView*)createLeftImage: (UITabBarController*)tab{
    NSUInteger selectedIndex = [tab selectedIndex];
    UIViewController* vc1 = [tab.viewControllers objectAtIndex:selectedIndex-1];
    UIImage* image1 = [self createImage:vc1.view rect:vc1.view.bounds];
    UIImageView * imageView =[[UIImageView alloc] initWithImage:image1];
    imageView.frame = CGRectMake(imageView.frame.origin.x - [UIScreen mainScreen].bounds.size.width, imageView.frame.origin.y , imageView.frame.size.width, imageView.frame.size.height);
    return imageView;
}
+(UIImageView*)createRightImage:(UITabBarController *)tab{
    NSUInteger selectedIndex = [tab selectedIndex];
    UIViewController* vc1 = [tab.viewControllers objectAtIndex:selectedIndex+1];
    UIImage* image1 = [self createImage:vc1.view rect:vc1.view.bounds];
    UIImageView * imageView =[[UIImageView alloc] initWithImage:image1];
    imageView.frame = CGRectMake(imageView.frame.origin.x + [UIScreen mainScreen].bounds.size.width, 0, imageView.frame.size.width, imageView.frame.size.height);
    return imageView;
}
+(UIImage*)createImage:(UIView*)image rect:(CGRect)rect{
    CGFloat scale = [[UIScreen mainScreen] scale];
    CGSize pageSize = CGSizeMake(scale*rect.size.width, scale*rect.size.height) ;
    UIGraphicsBeginImageContext(pageSize);
    CGContextScaleCTM(UIGraphicsGetCurrentContext(), scale, scale);
    CGContextRef resizedContext =UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(resizedContext,-1 *rect.origin.x,-1*rect.origin.y);
    [image.layer renderInContext:resizedContext];
    UIImage*imageOriginBackground =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    imageOriginBackground = [UIImage imageWithCGImage:imageOriginBackground.CGImage scale:scale orientation:UIImageOrientationUp];
    
    return imageOriginBackground;
}
+(void)panRightAndLeft:(UIPanGestureRecognizer*)recongizer setTabbar:(UITabBarController*)tabbar setView:(UIView*)view{
    
    NSUInteger index = [tabbar selectedIndex];
    
    CGPoint point = [recongizer translationInView:view];
    recongizer.view.center = CGPointMake(recongizer.view.center.x + point.x, recongizer.view.center.y);
    [recongizer setTranslation:CGPointMake(0, 0) inView:view];
    
    if (recongizer.state == UIGestureRecognizerStateEnded) {
        if (recongizer.view.center.x < [UIScreen mainScreen].bounds.size.width && recongizer.view.center.x > 0 ) {
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
            }completion:^(BOOL finished) {
                
            }];
        } else if (recongizer.view.center.x <= 0 ){
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                recongizer.view.center = CGPointMake(-[UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
            }completion:^(BOOL finished) {
                [tabbar setSelectedIndex:index+1];
                recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
            }];
        } else {
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width*1.5 ,[UIScreen mainScreen].bounds.size.height/2);
            }completion:^(BOOL finished) {
                [tabbar setSelectedIndex:index-1];
                recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
            }];
        }
    }
}



+(void)panRight:(UIPanGestureRecognizer*)recongizer setTabbar:(UITabBarController*)tabbar setView:(UIView*)view{
    
    NSUInteger index = [tabbar selectedIndex];
    CGPoint point = [recongizer translationInView:view];
    if (recongizer.view.center.x + point.x >  [UIScreen mainScreen].bounds.size.width/2) {
        recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, recongizer.view.center.y);
    } else {
        recongizer.view.center = CGPointMake(recongizer.view.center.x + point.x, recongizer.view.center.y);
    }
    [recongizer setTranslation:CGPointMake(0, 0) inView:view];
    
    if (recongizer.state == UIGestureRecognizerStateEnded) {
        if (recongizer.view.center.x <= [UIScreen mainScreen].bounds.size.width && recongizer.view.center.x > 0 ) {
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
            }completion:^(BOOL finished) {
                
            }];
        } else if (recongizer.view.center.x <= 0 ){
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                recongizer.view.center = CGPointMake(-[UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
            }completion:^(BOOL finished) {
                [tabbar setSelectedIndex:index+1];
                recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
            }];
        } else {
            
        }
    }
}

+(void)panLeft:(UIPanGestureRecognizer*)recongizer setTabbar:(UITabBarController*)tabbar setView:(UIView*)view{
    NSUInteger index = [tabbar selectedIndex];
    CGPoint point = [recongizer translationInView:view];
    if (recongizer.view.center.x + point.x <  [UIScreen mainScreen].bounds.size.width/2) {
        recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, recongizer.view.center.y);
    } else {
        recongizer.view.center = CGPointMake(recongizer.view.center.x + point.x, recongizer.view.center.y);
    }
    [recongizer setTranslation:CGPointMake(0, 0) inView:view];
    if (recongizer.state == UIGestureRecognizerStateEnded) {
        if (recongizer.view.center.x <= [UIScreen mainScreen].bounds.size.width && recongizer.view.center.x >= 0 ) {
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
            }completion:^(BOOL finished) {
            }];
        } else if (recongizer.view.center.x <= 0 ){
            
        } else {
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width*1.5 ,[UIScreen mainScreen].bounds.size.height/2);
            }completion:^(BOOL finished) {
                [tabbar setSelectedIndex:index-1];
                recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
            }];
        }
    }
}

@end
