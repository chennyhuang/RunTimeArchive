//
//  Person.m
//  test111
//
//  Created by 黄振宇 on 2018/2/27.
//  Copyright © 2018年 YunMei. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person
- (void)encodeWithCoder:(NSCoder *)aCoder{
    unsigned int count = 0;
    //这边要使用[Person class] 不能用 [self class]
    Ivar *ivarLists = class_copyIvarList([Person class], &count);
    for (int i = 0; i < count; i++) {
        const char *name = ivar_getName(ivarLists[i]);
        NSString *strName = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:strName] forKey:strName];
    }
    free(ivarLists);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivarLists = class_copyIvarList([Person class], &count);
        for (int i = 0; i < count; i++) {
            const char *name = ivar_getName(ivarLists[i]);
            NSString *strName = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:strName];
            [self setValue:value forKey:strName];
        }
        free(ivarLists);
    }
    return self;
}

-(instancetype)initWithName:(NSString *)name gender:(NSString *)gender address:(NSString *)adderss age:(NSUInteger)age{
    if (self = [super init]) {
        _name = name;
        _gender = gender;
        _address = adderss;
        _age = age;
    }
    return self;
}
-(NSString*)description{
    return [NSString stringWithFormat:@"name:%@  gender:%@  age:%lu  address:%@",self.name,self.gender,(unsigned long)self.age,self.address];
    
}
@end
