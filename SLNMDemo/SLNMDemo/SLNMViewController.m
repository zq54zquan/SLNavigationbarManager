//
//  SLNMViewController.m
//  SLNMDemo
//
//  Created by ZhouQuan on 14-1-20.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "SLNMViewController.h"
#import "SLNavigationBarManager.h"
@interface SLNMViewController ()
@property (nonatomic, strong) SLNavigationBarManager *navigationBarManager;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation SLNMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationBarManager = [[SLNavigationBarManager alloc] initWithViewController:self scollView:self.webView.scrollView];
    self.title = @"Demo";
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationBarManager addScrollObserver];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationBarManager pushedOrPulled];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
