//
//  Student.m
//  test111
//
//  Created by 黄振宇 on 2018/2/27.
//  Copyright © 2018年 YunMei. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>
@implementation Student
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList([Student class], &count);
    for (int i = 0; i < count; i++) {
        const char *name = ivar_getName(ivarList[i]);
        NSString *strName = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:strName] forKey:strName];
    }
    
    free(ivarList);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        unsigned int count = 0;
        Ivar *ivarList = class_copyIvarList([Student class], &count);
        for (int i = 0; i < count; i++) {
            const char *name = ivar_getName(ivarList[i]);
            NSString *strName = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:strName];
            [self setValue:value forKey:strName];
        }
        free(ivarList);
    }
    return self;
}

- (instancetype)initWithScore:(NSUInteger)score sex:(NSUInteger)sex name:(NSString *)name gender:(NSString *)gender address:(NSString *)address age:(NSUInteger)age{
    if (self = [super initWithName:name gender:gender address:address age:age]) {
        _score = score;
        _sex = sex;
    }
    return self;
}

-(NSString*)description{
    return [NSString stringWithFormat:@"score:%lu sex:%d name:%@  gender:%@  age:%lu  address:%@",self.score,self.sex,self.name,self.gender,(unsigned long)self.age,self.address];
}
@end
