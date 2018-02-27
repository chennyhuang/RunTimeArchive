//
//  Student.h
//  test111
//
//  Created by 黄振宇 on 2018/2/27.
//  Copyright © 2018年 YunMei. All rights reserved.
//

#import "Person.h"

@interface Student : Person
@property (nonatomic,assign) NSUInteger score;
@property (nonatomic,assign) BOOL sex;
- (instancetype)initWithScore:(NSUInteger)score sex:(NSUInteger)sex name:(NSString *)name gender:(NSString *)gender address:(NSString *)address age:(NSUInteger)age;
@end
