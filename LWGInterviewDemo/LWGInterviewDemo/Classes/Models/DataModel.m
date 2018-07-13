//
//  DataModel.m
//  LWGInterviewDemo
//
//  Created by LWG on 2018/7/13.
//  Copyright © 2018年 LWG. All rights reserved.
//

#import "DataModel.h"
#import "MJExtension.h"

@implementation DataModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"descStr":@"description"
             };
}@end
