//
//  Student.h
//  消息发送和消息转发
//
//  Created by james on 2018/4/3.
//  Copyright © 2018年 james. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

/**
 name
 */
@property(nonatomic,copy)NSString *name;
/**
 age
 */
@property(nonatomic,assign)NSInteger age;

/**
 class method return instance

 @param name name
 @param age age
 @return stu
 */
+(instancetype)studentWithName:(NSString *)name age:(NSInteger)age;

/**
 study instanceMethod
 */
- (void)study;
- (void)eat;
- (void)eat:(NSString *)foodName;
- (void)eat:(NSString *)foodName foodNum:(NSInteger)num;
@end
