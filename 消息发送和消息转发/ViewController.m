//
//  ViewController.m
//  消息发送和消息转发
//
//  Created by james on 2018/4/3.
//  Copyright © 2018年 james. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import <objc/message.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    Student *stu = [Student studentWithName:@"小明" age:12];
    [stu eat];
    

}




- (void)msgSend {
    //    Student *stu = [Student studentWithName:@"小明" age:12];
    //    [stu study];
    
    Student *stu = ((Student *(*)(id, SEL, NSString *, NSInteger))objc_msgSend)((id)[Student class], @selector(studentWithName:age:), @"小明",12);
    ((void (*) (id, SEL))objc_msgSend)((id)stu, @selector(study));
    
    
    
    ((void (*) (id,SEL))objc_msgSend)((id)stu,@selector(eat));
}
@end
