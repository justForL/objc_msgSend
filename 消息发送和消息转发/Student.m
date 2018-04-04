//
//  Student.m
//  消息发送和消息转发
//
//  Created by james on 2018/4/3.
//  Copyright © 2018年 james. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>
#import "Teacher.h"
#import <objc/message.h>
@implementation Student
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    if (self = [super init]) {
        _name = name;
        _age = age;
    }
    return self;
}
+ (instancetype)studentWithName:(NSString *)name age:(NSInteger)age {
    return [[self alloc]initWithName:name age:age];
}

- (void)study {
    NSLog(@"%@-----看书呢",self.name);
}
#pragma mark - 防止崩溃处理方法
- (void)doesNotRecognizeSelector:(SEL)aSelector  {
    NSLog(@"123");
    
    
}
//- (void)eat {
//    NSLog(@"%@-----吃饭呢",self.name);
//}
#pragma mark - 无参数
//+(BOOL) resolveInstanceMethod:(SEL) sel {
//
//    if (sel == @selector(eat:)) {
//        class_addMethod(self, sel, (IMP)eatNew, "v@:");
//        return YES;
//    }
//    return [super respondsToSelector:sel];
//}

#pragma mark - 一个参数
//+(BOOL) resolveInstanceMethod:(SEL) sel {
//
//    if (sel == @selector(eat:)) {
//        class_addMethod(self, sel, (IMP)eatNew, "v@:@");
//        return YES;
//    }
//    return [super respondsToSelector:sel];
//}
#pragma mark - 两个参数
//+(BOOL) resolveInstanceMethod:(SEL) sel {
//
//    if (sel == @selector(eat:foodNum:)) {
//        class_addMethod(self, sel, (IMP)eatNew, "v@:@i");
//        return YES;
//    }
//    return [super respondsToSelector:sel];
//}


#pragma mark - 无参数方法
void eatNew(id self, SEL sel) {
    NSLog(@"%@---------",self);
}
#pragma mark - 一个参数方法
//void eatNew(id self, SEL sel, NSString * str) {
//    NSLog(@"%@---------%@",self,str);
//}
#pragma mark - 两个参数方法
//void eatNew(id self, SEL sel, NSString * str, int i) {
//    NSLog(@"%@---------%@",self,str);
//}
#pragma mark - 快速消息转发
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    Teacher *t = [Teacher new];
//    return t;
//}
#pragma mark - 标准消息转发
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSString *sel = NSStringFromSelector(aSelector);
    if ([sel isEqualToString:@"eat"]) {
        NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:"];
        return signature;
    }
    return [super methodSignatureForSelector:aSelector];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    //取sel
    SEL sel = [anInvocation selector];
    //转发
    Teacher *teacher = [Teacher new];
    if ([teacher respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:teacher];
    }else{
        [super forwardInvocation:anInvocation];
    }
}
@end
