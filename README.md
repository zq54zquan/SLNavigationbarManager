SLNavigationbarManager
======================

滚动view根据滚动位置是否全屏显示


# Installation
`pod 'SLNavigationBarManager', '~> 0.0.1'`

# Usage
In you view Controller:

```objective-c
@property (nonatomic, strong) SLNavigationBarManager *navigationBarManager;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationBarManager = [[SLNavigationBarManager alloc] initWithViewController:self scollView:self.webView.scrollView];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationBarManager addScrollObserver];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationBarManager pushedOrPulled];
}
```
