////
////  ZHCNavigationController.m
////  HungryTools
////
////  Created by 张海川 on 2020/8/31.
////
//
//#import "ZHCNavigationController.h"
//
//@interface ZHCNavigationController () <UIGestureRecognizerDelegate>
//
//@property (nonatomic, strong) UIPanGestureRecognizer *zhc_popGesture;
//
//@end
//
//@implementation ZHCNavigationController
//
//#pragma mark - Life Cycle
//
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return [[self.childViewControllers lastObject] preferredStatusBarStyle];
//}
//
//#pragma mark - Layout
//
////- (void)configNavigationBarUI {
////    UINavigationBar *naviBar = UINavigationBar.appearance;
////    [naviBar setBackgroundImage:[UIImage imageWithColor:UIColor.whiteColor] forBarMetrics:UIBarMetricsDefault];
////
////    [naviBar setTitleTextAttributes:@{
////        NSFontAttributeName: [UIFont systemFontOfSize:17 weight:UIFontWeightMedium],
////        NSForegroundColorAttributeName : UIColor.blackColor
////    }];
////    naviBar.tintColor = UIColor.blackColor;
////    naviBar.shadowImage = [UIImage new];
////}
//
//#pragma mark - @overwrite
//
//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    [self checkGesture];
//    [self setBackButton:viewController atIndex:self.childViewControllers.count];
//    
//    [super pushViewController:viewController animated:animated];
//}
//
//- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated {
//    [self checkGesture];
//    for (int i = 1; i < viewControllers.count; i++) {   // 第一个不设置
//        [self setBackButton:viewControllers[i] atIndex:i];
//    }
//    
//    [super setViewControllers:viewControllers animated:animated];
//}
//
//#pragma mark - User Interaction
//
//- (void)backAction {
//    if (self.childViewControllers.count < 2) {
//        return;
//    }
//    
//    if ([self.visibleViewController respondsToSelector:@selector(zhc_navigationControllerCanPopBackByClick)]) {
//        BOOL canPop = (BOOL)[self.visibleViewController performSelector:@selector(zhc_navigationControllerCanPopBackByClick)];
//        if (canPop) {
//            [self popViewControllerAnimated:YES];
//        }
//        return;
//    }
//    
//    if ([self.visibleViewController respondsToSelector:@selector(zhc_navigationControllerCanPopBack)]) {
//        BOOL canPop = (BOOL)[self.visibleViewController performSelector:@selector(zhc_navigationControllerCanPopBack)];
//        if (canPop) {
//            [self popViewControllerAnimated:YES];
//        }
//        return;
//    }
//    
//    [self popViewControllerAnimated:YES];
//}
//
//#pragma mark - UIGestureRecognizerDelegate
//
//- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
//    if (self.childViewControllers.count < 2) {
//        return NO;
//    }
//
//    // Ignore pan gesture when the navigation controller is currently in transition.
//    if ([[self.navigationController valueForKey:@"_isTransitioning"] boolValue]) {
//        return NO;
//    }
//    
//    // Prevent calling the handler when the gesture begins in an opposite direction.
//    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
//    if (translation.x <= 0) {
//        return NO;
//    }
//    
//    if ([self.visibleViewController respondsToSelector:@selector(zhc_navigationControllerCanPopBackByGesture)]) {
//        return (BOOL)[self.visibleViewController performSelector:@selector(zhc_navigationControllerCanPopBackByGesture)];
//    }
//    
//    if ([self.visibleViewController respondsToSelector:@selector(zhc_navigationControllerCanPopBack)]) {
//        return (BOOL)[self.visibleViewController performSelector:@selector(zhc_navigationControllerCanPopBack)];
//    }
//    
//    return YES;
//}
//
//#pragma mark - UINavigationBarDelegate
//
//// 在不同系统上，扩展和子类里表现不一，所以就不支持默认返回按钮(backBarButtonItem)的拦截了
////- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
////    return [self canPopByClickOrGesture];
////}
//
//#pragma mark - Helper
//
//- (void)checkGesture {
//    if (![self.interactivePopGestureRecognizer.view.gestureRecognizers containsObject:self.zhc_popGesture]) {
//        
//        [self.interactivePopGestureRecognizer.view addGestureRecognizer:self.zhc_popGesture];
//
//        NSArray *internalTargets = [self.interactivePopGestureRecognizer valueForKey:@"targets"];
//        id internalTarget = [internalTargets.firstObject valueForKey:@"target"];
//        SEL internalAction = NSSelectorFromString(@"handleNavigationTransition:");
//        self.zhc_popGesture.delegate = self;
//        [self.zhc_popGesture addTarget:internalTarget action:internalAction];
//    }
//    self.interactivePopGestureRecognizer.enabled = NO;
//}
//
//- (void)setBackButton:(UIViewController *)viewController atIndex:(NSInteger)index {
//    if (index < 1) {
//        return;
//    }
//    
//    if (![viewController respondsToSelector:@selector(zhc_navigationControllerBackItemContent)]) {
//        return;
//    }
//    
//    id content = [viewController performSelector:@selector(zhc_navigationControllerBackItemContent)];
//    if (!content) {
//        return;
//    }
//    
//    SEL action = @selector(backAction);
//    
//    UIBarButtonItem *leftItem;
//    if ([content isKindOfClass:UIView.class]) {
//        if ([content isKindOfClass:UIButton.class]) {
//            [(UIButton *)content addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
//        } else {
//            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
//            [(UIView *)content addGestureRecognizer:tap];
//        }
//        leftItem = [[UIBarButtonItem alloc] initWithCustomView:content];
//    } else {
//        UIImage *image;
//        if ([content isKindOfClass:UIImage.class]) {
//            image = content;
//        } else if ([content isKindOfClass:NSString.class]) {
//            image = [UIImage imageNamed:content];
//        }
//        if (image) {
//            if ([viewController respondsToSelector:@selector(zhc_navigationControllerBackItemTintColor)]) {
//                // initWithCustomView设置tintcolor无效
//                leftItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:action];
//                leftItem.tintColor = [viewController performSelector:@selector(zhc_navigationControllerBackItemTintColor)];
//            } else {
//                UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//                UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 35, 44)];
//                
//                [customView addSubview:imageView];
//                [imageView sizeToFit];
//                CGRect frame = imageView.frame;
//                frame.origin.x = 0;
//                imageView.frame = frame;
//                imageView.center = CGPointMake(imageView.center.x, customView.center.y);
//                
//                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
//                [customView addGestureRecognizer:tap];
//                
//                leftItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
//            }
//        }
//    }
//    if (!leftItem) {
//        return;
//    }
//    
//    viewController.navigationItem.leftBarButtonItem = leftItem;
//}
//
//#pragma mark - Getter
//
//- (UIPanGestureRecognizer *)zhc_popGesture {
//    if (!_zhc_popGesture) {
//        _zhc_popGesture = [[UIPanGestureRecognizer alloc] init];
//        _zhc_popGesture.maximumNumberOfTouches = 1;
//    }
//    return _zhc_popGesture;
//}
//
//@end
