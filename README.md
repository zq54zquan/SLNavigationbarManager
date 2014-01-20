SLNavigationbarManager
======================

滚动view根据滚动位置是否全屏显示

pod 'SLNavigationBarManager', '~> 0.0.1'


How to use:
In you view Controller:

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
