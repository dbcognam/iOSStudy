//
//  AppDelegate.m
//  OpenWeather
//
//  Created by JeonYongNam on 2014. 2. 4..
//  Copyright (c) 2014년 JeonYongNam. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize window = _window;
@synthesize navigationController1 = _navigationController1;
@synthesize navigationController2 = _navigationController2;
@synthesize navigationController3 = _navigationController3;
@synthesize navigationController4 = _navigationController4;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    _window.backgroundColor = [UIColor whiteColor];
    
    
    UITabBarController *tabbarController = [[UITabBarController alloc]init];
    
    HomeViewController *homeViewController1 = [[HomeViewController alloc]init];
    [homeViewController1 setOneDepthType:OneDepthType_TodayWMP];
    HomeViewController *homeViewController2 = [[HomeViewController alloc]init];
    [homeViewController2 setOneDepthType:OneDepthType_TodayOpen];
    HomeViewController *homeViewController3 = [[HomeViewController alloc]init];
    [homeViewController3 setOneDepthType:OneDepthType_TodayEnd];
    HomeViewController *homeViewController4 = [[HomeViewController alloc]init];
    [homeViewController4 setOneDepthType:OneDepthType_TodayDeadLine];
    
    _navigationController1 = [[UINavigationController alloc]initWithRootViewController:homeViewController1];
    _navigationController2 = [[UINavigationController alloc]initWithRootViewController:homeViewController2];
    _navigationController3 = [[UINavigationController alloc]initWithRootViewController:homeViewController3];
    _navigationController4 = [[UINavigationController alloc]initWithRootViewController:homeViewController4];
    
    [tabbarController setViewControllers:@[_navigationController1,_navigationController2,_navigationController3,_navigationController4]];
    
    [_window setRootViewController:tabbarController];
    
    [_window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
