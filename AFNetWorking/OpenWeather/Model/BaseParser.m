//
//  BaseParser.m
//  OpenWeather
//
//  Created by JeonYongNam on 2014. 2. 5..
//  Copyright (c) 2014년 JeonYongNam. All rights reserved.
//

#import "BaseParser.h"

@implementation BaseParser

- (BOOL)isNull:(id)obj
{
	return (obj == nil || obj == [NSNull null]);
}

- (BOOL)isDictionary:(id)obj
{
	return ([self isNull:obj] == NO && [obj isKindOfClass:[NSDictionary class]]);
}

- (BOOL)isArray:(id)obj
{
	return ([self isNull:obj] == NO && [obj isKindOfClass:[NSArray class]]);
}

- (BOOL)isString:(id)obj
{
	return ([self isNull:obj] == NO && [obj isKindOfClass:[NSString class]]);
}

- (BOOL)isNumber:(id)obj
{
	return ([self isNull:obj] == NO && [obj isKindOfClass:[NSNumber class]]);
}

- (BOOL)parseToBOOL:(id)obj
{
    if ([self isNumber:obj])
    {
        return [obj boolValue];
    } else if ([self isString:obj]) {
        return [((NSString *)obj) boolValue];
    }
    
    return NO;
}

- (NSInteger)parseToInt:(id)obj
{
	if ([self isNumber:obj])
    {
		return [obj intValue];
	}
	
	return 0;
}

- (double)parseToDouble:(id)obj
{
	if ([self isNumber:obj])
    {
		return [obj doubleValue];
	}
	
	return 0;
}

- (NSString*)parseToString:(id)obj
{
	if ([self isString:obj])
    {
		return obj;
	}
	else if ([self isNumber:obj])
    {
		return [obj stringValue];
	}
	
	return nil;
}


@end
