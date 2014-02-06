//
//  HomeViewController.m
//  OpenWeather
//
//  Created by JeonYongNam on 2014. 2. 4..
//  Copyright (c) 2014년 JeonYongNam. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeDetailViewController.h"


#define kHomeTableCellHeight 100

@interface HomeViewController ()
{
}
@property (nonatomic, strong) NSURLSessionTask *homeTableRequestTask;
@property (nonatomic) NSInteger page;
@property (nonatomic, strong) UITableView *openWeatherTable;
@property (nonatomic, strong) HomeTableModel *homeTableModel;

@end

@implementation HomeViewController
@synthesize oneDepthType = _oneDepthType;

@synthesize homeTableRequestTask = _homeTableRequestTask;
@synthesize homeTableModel = _homeTableModel;
@synthesize openWeatherTable = _openWeatherTable;
@synthesize page = _page;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setTitle:@"AFNetwork TEST"];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:activityIndicatorView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reload:)];
    
    _openWeatherTable = [[UITableView alloc]initWithFrame:self.view.frame];
    [_openWeatherTable setDataSource:self];
    [_openWeatherTable  setDelegate:self];
    [_openWeatherTable setContentOffset:CGPointMake(0, 0)];
    [self.view addSubview:_openWeatherTable];

    _homeTableModel = [[HomeTableModel alloc]init];
    _homeTableModel.totalPage = 0;
    
    [self reload:self.navigationItem.rightBarButtonItem];

}

- (void)viewWillAppear:(BOOL)animated
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - request

- (void)reload:(UIBarButtonItem *)reloadButton
{
    if(reloadButton != nil)
    {
        _page = 1;
    }
    else
    {
        if((_homeTableModel.totalPage != 0) && (_page != 0))
        {
            if(_homeTableModel.totalPage > _page)
            {
                _page ++;
            }
            else
            {
                return;
            }
        }
    }
    
    NSString *requestStingUrl = @"http://www.wemakeprice.com/app/api/deal/get_list?";
    NSMutableDictionary *requestParamater = [NSMutableDictionary dictionary];

    [requestParamater setObject:[NSString stringWithFormat:@"%d",_oneDepthType] forKey:@"cmd"];
    [requestParamater setObject:@"3.5.1" forKey:@"app_version"];
    [requestParamater setObject:[NSString stringWithFormat:@"%d",_page] forKey:@"idx_page"];
    [requestParamater setObject:@"1" forKey:@"os_type"];
    
    [_homeTableModel setRequestUrl:requestStingUrl RequsetParamater:requestParamater requestMoreFlag:(_page == 1) ? NO : YES];
    _homeTableRequestTask = [_homeTableModel globalTimelinePostsWithBlock:^(NSMutableDictionary *allData, NSError *error)
    {

        if (!error)
        {
            if(_page == 1)
            {
                [_openWeatherTable scrollRectToVisible:CGRectMake(0, self.view.frame.origin.y, 1, 1) animated:NO];
            }
            [_openWeatherTable reloadData];
        }
        else
        {
            NSLog(@"%@",error);
        }
    }];
    
    
    [UIAlertView showAlertViewForTaskWithErrorOnCompletion:_homeTableRequestTask delegate:nil];
    UIActivityIndicatorView *activityIndicatorView = (UIActivityIndicatorView *)self.navigationItem.leftBarButtonItem.customView;
    [activityIndicatorView setAnimatingWithStateOfTask:_homeTableRequestTask];
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_homeTableRequestTask)
    {
        if (_homeTableRequestTask.state != NSURLSessionTaskStateCompleted)
        {
            if (_homeTableRequestTask.state == NSURLSessionTaskStateRunning)
            {

            }
            else
            {

            }
        }
        else
        {
            if(scrollView.contentOffset.y + _openWeatherTable.frame.size.height > scrollView.contentSize.height)
            {
                [self reload:nil];
            }
        }
    }
}


#pragma mark - UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kHomeTableCellHeight;
}

- (NSInteger)tableView:(__unused UITableView *)tableView numberOfRowsInSection:(__unused NSInteger)section
{
    return _homeTableModel.marrList_name.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    HomeTableCustomCell *cell =  (HomeTableCustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[HomeTableCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell initwithCustomCellFrame:CGRectMake(0, 0, _openWeatherTable.frame.size.width, kHomeTableCellHeight)];
    }
    
    NSURL *urlimg = [NSURL URLWithString:[_homeTableModel.marrList_ImageUrl objectAtIndex:indexPath.row]];
    __weak UIImageView *weakImageView = cell.imgv_avartar;
    __block UIActivityIndicatorView *activityIndicator;
    
    [weakImageView addSubview:activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite]];
    [activityIndicator setColor:[UIColor blackColor ]];
    [activityIndicator setCenter:weakImageView.center];
    [activityIndicator startAnimating];
    
    [weakImageView setImageWithURL:urlimg
                   placeholderImage:nil
                            options:SDWebImageLowPriority
                          completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                              [weakImageView setAlpha:0.0];
                              [UIView animateWithDuration:0.5 animations:^{
                                  [weakImageView setAlpha:1.0f];
                                  
                                  [activityIndicator removeFromSuperview];
                                  activityIndicator = nil;

                              }];
                          }];
    
    [cell.lbl_title setText:[_homeTableModel.marrList_name objectAtIndex:indexPath.row]];

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HomeDetailViewController *homeDetailViewController = [[HomeDetailViewController alloc]init];
    HomeTableCustomCell *homeTableCustomCell = (HomeTableCustomCell*)[tableView cellForRowAtIndexPath:indexPath];
    if([homeTableCustomCell.imgv_avartar.image isKindOfClass:[NSNull class]])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"NO Image" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    homeDetailViewController.img_SelectedCell = homeTableCustomCell.imgv_avartar.image;
    [self.navigationController pushViewController:homeDetailViewController animated:YES];
}



@end
