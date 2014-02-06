//
//  HomeDetailViewController.m
//  OpenWeather
//
//  Created by JeonYongNam on 2014. 2. 5..
//  Copyright (c) 2014년 JeonYongNam. All rights reserved.
//

#import "HomeDetailViewController.h"

@interface HomeDetailViewController ()

@end

@implementation HomeDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *imgv_SelectedCell = [[UIImageView alloc]initWithFrame:self.view.frame];
    [imgv_SelectedCell setImage:self.img_SelectedCell];
    [self.view addSubview:imgv_SelectedCell];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
