//
//  HomeTableCustomCell.h
//  OpenWeather
//
//  Created by JeonYongNam on 2014. 2. 5..
//  Copyright (c) 2014년 JeonYongNam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableCustomCell : UITableViewCell

@property (nonatomic, strong) UIImageView *imgv_avartar;
@property (nonatomic, strong) UILabel *lbl_title;

- (void)initwithCustomCellFrame:(CGRect )aFrame;

@end
