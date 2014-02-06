//
//  HomeTableModel.m
//  OpenWeather
//
//  Created by JeonYongNam on 2014. 2. 5..
//  Copyright (c) 2014년 JeonYongNam. All rights reserved.
//

#import "HomeTableModel.h"
#import "AFAppDotNetAPIClient.h"

@implementation HomeTableModel

@synthesize marrList_name = _marrList_name;
@synthesize marrList_ImageUrl = _marrList_ImageUrl;
@synthesize totalPage = _totalPage;

@synthesize requestMoreFlag = _requestMoreFlag;
@synthesize requestURL = _requestURL;
@synthesize requestPramater = _requestPramater;

- (void)setRequestUrl:(NSString *)aRequesUrlSting RequsetParamater:(NSDictionary *)aRequestPramater requestMoreFlag:(BOOL)aRequestMoreFlag
{
    _requestURL = aRequesUrlSting;
    _requestPramater = aRequestPramater;
    _requestMoreFlag = aRequestMoreFlag;
}


- (void)initwithData:(NSMutableDictionary *)mutableDic
{
    if ([self isDictionary:[mutableDic objectForKey:@"list"]])
    {
        if ([self isArray:[[mutableDic objectForKey:@"list"] objectForKey:@"list"]])
        {
            for (int idx = 0; idx < [[[mutableDic objectForKey:@"list"] objectForKey:@"list"]count] ; idx++)
            {
                if([self isDictionary:[[[mutableDic objectForKey:@"list"] objectForKey:@"list"] objectAtIndex:idx]])
                {
                    if(![self isNull:[[[[mutableDic objectForKey:@"list"] objectForKey:@"list"] objectAtIndex:idx] objectForKey:@"idx"]])
                   {
                      if([[[[[mutableDic objectForKey:@"list"] objectForKey:@"list"] objectAtIndex:idx] objectForKey:@"idx"]integerValue] == 1 )
                      {
                          if(![self isNull:[[[[mutableDic objectForKey:@"list"] objectForKey:@"list"] objectAtIndex:idx] objectForKey:@"total_page"]])
                          {
                              _totalPage = [[[[[mutableDic objectForKey:@"list"] objectForKey:@"list"] objectAtIndex:idx] objectForKey:@"total_page"]integerValue];
                          }
                          
                          if(_requestMoreFlag == NO)
                          {
                              [_marrList_ImageUrl removeAllObjects];
                              _marrList_ImageUrl = [NSMutableArray array];
                              
                              [_marrList_name removeAllObjects];
                              _marrList_name = [NSMutableArray array];
                          }
                          
                          if(![self isNull:[[[[mutableDic objectForKey:@"list"] objectForKey:@"list"] objectAtIndex:idx] objectForKey:@"list"]])
                          {
                              for (int idx2 = 0; idx2 <[[[[[mutableDic objectForKey:@"list"] objectForKey:@"list"] objectAtIndex:idx] objectForKey:@"list"]count]; idx2++)
                              {
                                  if (![self isNull:[[[[[[mutableDic objectForKey:@"list"] objectForKey:@"list"] objectAtIndex:idx] objectForKey:@"list"]objectAtIndex:idx2]objectForKey:@"img_deal_list2"]])
                                  {
                                      [_marrList_ImageUrl addObject:[[[[[[mutableDic objectForKey:@"list"] objectForKey:@"list"] objectAtIndex:idx] objectForKey:@"list"]objectAtIndex:idx2]objectForKey:@"img_deal_list2"]];
                                  }
                                  if (![self isNull:[[[[[[mutableDic objectForKey:@"list"] objectForKey:@"list"] objectAtIndex:idx] objectForKey:@"list"]objectAtIndex:idx2]objectForKey:@"deal_name"]])
                                  {
                                      [_marrList_name addObject:[[[[[[mutableDic objectForKey:@"list"] objectForKey:@"list"] objectAtIndex:idx] objectForKey:@"list"]objectAtIndex:idx2]objectForKey:@"deal_name"]];
                                  }
                              }
                           }
                      }
                   }
                }
            }
        }
    }
}

- (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSMutableDictionary *allData, NSError *error))block
{

    return [[AFAppDotNetAPIClient sharedClient] GET:_requestURL parameters:_requestPramater success:^(NSURLSessionDataTask * __unused task, NSMutableDictionary *JSON)
            {
                if (block)
                {
                    if(![JSON isKindOfClass:[NSNull class]])
                    {
                        [self initwithData:JSON];
                        block(JSON, nil);
                    }
                }
            }
           failure:^(NSURLSessionDataTask *__unused task, NSError *error)
            {
                if (block) {
                    
                }
            }];
}



@end
