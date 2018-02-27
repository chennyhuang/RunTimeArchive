//
//  Person.h
//  test111
//
//  Created by 黄振宇 on 2018/2/27.
//  Copyright © 2018年 YunMei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property(nonatomic,strong) NSString * name;//名字
@property(nonatomic,strong) NSString * gender;//性别
@property(nonatomic,strong) NSString * address;//地址
@property(nonatomic) NSUInteger age;//年龄
-(instancetype)initWithName:(NSString*)name gender:(NSString*)gender address:(NSString*)adderss age:(NSUInteger)age;
@end
