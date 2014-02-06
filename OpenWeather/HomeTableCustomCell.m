//
//  HomeTableCustomCell.m
//  OpenWeather
//
//  Created by JeonYongNam on 2014. 2. 5..
//  Copyright (c) 2014년 JeonYongNam. All rights reserved.
//

#import "HomeTableCustomCell.h"

@implementation HomeTableCustomCell
{
    CGRect selfFrame;
}
@synthesize imgv_avartar = _imgv_avartar;
@synthesize lbl_title = _lbl_title;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)initwithCustomCellFrame:(CGRect )aFrame
{
    selfFrame = aFrame;
    [self setFrame:aFrame];
    [self initializing];
}

- (void)initializing
{
    _imgv_avartar = [[UIImageView alloc]initWithFrame:CGRectMake(selfFrame.origin.x , selfFrame.origin.y, selfFrame.size.height, selfFrame.size.height)];
    [self addSubview:_imgv_avartar];
    
    
    _lbl_title = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX([_imgv_avartar frame]) , selfFrame.origin.y + selfFrame.size.height/2 -20 , selfFrame.size.width - CGRectGetMaxX([_imgv_avartar frame]) , 20)];
    [self addSubview:_lbl_title];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
