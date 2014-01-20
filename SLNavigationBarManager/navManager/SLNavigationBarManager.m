//
//  SLNavigationBarManager.m
//  ShuLiu
//
//  Created by ZhouQuan on 14-1-17.
//  Copyright (c) 2014年 ShuLiu Group. All rights reserved.
//

#import "SLNavigationBarManager.h"
@interface SLNavigationBarManager()
@property (nonatomic,assign) CGPoint preOffset;
@end
@implementation SLNavigationBarManager
-(id)initWithViewController:(UIViewController *)viewController scollView:(UIScrollView *)scrollView{
    self = [super init];
    if (self) {
        self.viewController = viewController;
        self.scrollView = scrollView;
    }
    return self;
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if (object == self.scrollView&&[keyPath isEqualToString:@"contentOffset"]) {
        CGPoint point = [[change valueForKey:@"new"] CGPointValue];
        float des = -20;
        float start = -64;
        float distance = MIN(des, MAX(start, point.y))-start;
        self.viewController.navigationController.navigationBar.frame = CGRectMake(0, 0-distance+20, 320, 44);
        float alpha = 1-(-distance)/(-44);
        const CGFloat *color = CGColorGetComponents(self.viewController.navigationController.navigationBar.tintColor.CGColor);
        if (color) {
            [self.viewController.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:color[0] green:color[1] blue:color[2] alpha:alpha]}];
            self.viewController.navigationController.navigationBar.tintColor = [UIColor colorWithRed:color[0] green:color[1] blue:color[2] alpha:alpha];
        }
        
    }
}

-(void)addScrollObserver{
    [self.scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)pushedOrPulled{
    self.viewController.navigationController.navigationBar.frame = CGRectMake(0, 20, 320, 44);
    const CGFloat *color = CGColorGetComponents(self.viewController.navigationController.navigationBar.tintColor.CGColor);
    if (color) {
        [self.viewController.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:color[0] green:color[1] blue:color[2] alpha:1]}];
        self.viewController.navigationController.navigationBar.tintColor = [UIColor colorWithRed:color[0] green:color[1] blue:color[2] alpha:1];
    }
    [self.scrollView removeObserver:self forKeyPath:@"contentOffset"];
}

-(void)dealloc{
    [self pushedOrPulled];
}

@end
