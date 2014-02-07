//
//  BaseParser.h
//  OpenWeather
//
//  Created by JeonYongNam on 2014. 2. 5..
//  Copyright (c) 2014년 JeonYongNam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseParser : NSObject

- (BOOL)isNull:(id)obj;
- (BOOL)isDictionary:(id)obj;
- (BOOL)isArray:(id)obj;
- (BOOL)isString:(id)obj;
- (BOOL)isNumber:(id)obj;

- (NSInteger)parseToInt:(id)obj;
- (double)parseToDouble:(id)obj;
- (NSString*)parseToString:(id)obj;
- (BOOL)parseToBOOL:(id)obj;


@end
