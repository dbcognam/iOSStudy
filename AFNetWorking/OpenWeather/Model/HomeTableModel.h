//
//  HomeTableModel.h
//  OpenWeather
//
//  Created by JeonYongNam on 2014. 2. 5..
//  Copyright (c) 2014년 JeonYongNam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeTableModel : BaseParser
{
    
}
//public
@property (nonatomic, strong) NSMutableArray *marrList_name;
@property (nonatomic, strong) NSMutableArray *marrList_ImageUrl;
@property (nonatomic) NSInteger totalPage;


//private
@property (nonatomic, readonly) BOOL requestMoreFlag;
@property (nonatomic, strong , readonly) NSString *requestURL;
@property (nonatomic, strong , readonly) NSDictionary *requestPramater;


- (void)setRequestUrl:(NSString *)aRequesUrlSting RequsetParamater:(NSDictionary *)aRequestPramater requestMoreFlag:(BOOL)aRequestMoreFlag;
- (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSMutableDictionary *allData, NSError *error))block;

@end
