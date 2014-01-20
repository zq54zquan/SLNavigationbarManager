//
//  SLNavigationBarManager.h
//  ShuLiu
//
//  Created by ZhouQuan on 14-1-17.
//  Copyright (c) 2014年 ShuLiu Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLNavigationBarManager : NSObject
@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) UIScrollView *scrollView;
-(id)initWithViewController:(UIViewController *)viewController scollView:(UIScrollView *)scrollView;
-(void)pushedOrPulled;
-(void)addScrollObserver;
@end
