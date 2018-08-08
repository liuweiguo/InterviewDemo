//
//  DataModel.h
//  LWGInterviewDemo
//
//  Created by LWG on 2018/7/13.
//  Copyright © 2018年 LWG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

/**
 标题
 */
@property (nonatomic,copy) NSString * title;

/**
 描述文字
 */
@property (nonatomic,copy) NSString * descStr;

/**
 图片URL
 */
@property (nonatomic,copy) NSString * imageHref;
@end
