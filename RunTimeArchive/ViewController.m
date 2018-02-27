//
//  ViewController.m
//  RunTimeArchive
//
//  Created by 黄振宇 on 2018/2/27.
//  Copyright © 2018年 YunMei. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Student.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"person"];
    
    Person *p = [[Person alloc] initWithName:@"huang" gender:@"man" address:@"doiawejdo" age:20];
    [NSKeyedArchiver archiveRootObject:p toFile:path];

    Person *p1 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"%@",p1);
    
//    Student *stu = [[Student alloc] initWithScore:100 sex:0 name:@"huang" gender:@"xx" address:@"dwadw" age:20];
//    [NSKeyedArchiver archiveRootObject:stu toFile:path];
//    
//    Student *stu1 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
//    NSLog(@"%@",stu1);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
