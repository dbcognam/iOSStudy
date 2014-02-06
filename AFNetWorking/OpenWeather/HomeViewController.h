//
//  HomeViewController.h
//  OpenWeather
//
//  Created by JeonYongNam on 2014. 2. 4..
//  Copyright (c) 2014년 JeonYongNam. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, OneDepthType) {
    ///오늘의 위메프
    OneDepthType_TodayWMP = 0,
    ///오늘오픈
    OneDepthType_TodayOpen,
    ///오늘마감
    OneDepthType_TodayEnd,
    ///매진임박
    OneDepthType_TodayDeadLine,
} ;


@interface HomeViewController : SuperViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) OneDepthType oneDepthType;




@end
