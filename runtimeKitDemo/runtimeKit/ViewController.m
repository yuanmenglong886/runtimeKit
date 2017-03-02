//
//  ViewController.m
//  runtimeKit
//
//  Created by 58 on 17/2/25.
//  Copyright © 2017年 yuanmenglong. All rights reserved.
//

#import "ViewController.h"
#import "runtimeKit.h"
#import <objc/runtime.h>
@interface ViewController ()
@property (nonatomic,assign) BOOL zhang;
@property (atomic,copy) NSString *yuan;
@end

@implementation ViewController
const char keyName;
const char setName;
- (void)setName:(NSString *)name
{
//    static char  key;
//      const char *key = [NSStringFromClass([object class]) cStringUsingEncoding:NSUTF8StringEncoding];
      objc_setAssociatedObject(self,&keyName,name, OBJC_ASSOCIATION_RETAIN);
}
- (NSString*)name
{
    return objc_getAssociatedObject(self, &keyName);
}
- (void)setSex:(NSString *)name
{
//    static char  key;
//      const char *key = [NSStringFromClass([object class]) cStringUsingEncoding:NSUTF8StringEncoding];
      objc_setAssociatedObject(self,&setName,name, OBJC_ASSOCIATION_RETAIN);
}
+ (void)hello
{
    NSLog(@"hello %d %@ %@,",__LINE__,self,NSStringFromSelector(_cmd));
}
- (NSString*)sex
{
    return objc_getAssociatedObject(self, &setName);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setName:@"yuanmenglong"];
     [self setSex:@"name"];
    NSLog(@"%@",[self name]);
    NSLog(@"%@",[self sex]);
   
    
    
       const char *name = "YMLProcolo";
    
    Protocol *protocol = objc_allocateProtocol(name);
//    objc_registerProtocol(protocol);
//        [runtimeKit addPrtocol:nil toClass:[self class]];
       [runtimeKit addPrtocol:@"<NSCopying>" toClass:[self class]];
       [runtimeKit addPrtocol:@"NSCoding" toClass:[self class]];
    
//       [runtimeKit addProperty:@"age" ToObject:self];
    
//       NSLog(@"%@",[runtimeKit getValueFromProperty:@"age" withObject:self]);
      const char *Name = @encode(int);
//          [(NSNumber *)self objcType];
      NSLog(@"%s",Name);
    NSString *class = [runtimeKit fetchClassName:self];
    NSLog(@"%@",class);
    NSArray *ivarList = [runtimeKit fetchIvarList:self];
    NSLog(@"%@",ivarList);
//    NSArray *ivarSuperList = [runtimeKit fetchIvarClass:[self superclass]];
//    NSLog(@"%@",ivarSuperList);
//    
   NSLog(@"111111%@",[runtimeKit fetchPropertyList:[self class]]);
  
    NSLog(@"333333%@",[runtimeKit fetchProtocolList:[self class]]);
    
    SEL sel = @selector(test);
    
    [runtimeKit addInstanceTargetClass:[self class] originClass:[runtimeKit class] method:sel];
    [self performSelector:sel];
//    [runtimeKit addInstanceMethod:[runtimeKit class] method:sel];
    
    
  NSLog(@"222222%@",[runtimeKit fetchMethodList:[self class]]);
  
  SEL test = @selector(test);
  SEL test2 = @selector(test2);
  
    [runtimeKit addInstanceTargetClass:[self class] originClass:[runtimeKit class] method:test];
    [self performSelector:test];
    
    SEL print = @selector(print);
    SEL hello = @selector(hello);
    [runtimeKit classMethodExchangeOriginClass:[runtimeKit class] originMethod:print exchangeClass:[self class] exchangeMethod:hello];
//    [ViewController ];
    [ViewController performSelector:hello];
    [runtimeKit performSelector:print];
    
//   [runtimeKit methodExchangeOriginClass:[runtimeKit class] originMethod:test exchangeClass:[self class] exchangeMethod:test2];
//  [runtimeKit methodExchange:[self class] originMethod:test replaceMethod:test2];
//  [self test2];
//  [self performSelector:@selector(test)];
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],@"key1",[NSNumber numberWithDouble:1.00f],@"key2",[NSNumber numberWithInt:1],@"key3",[NSNumber numberWithFloat:33.0f], @"key4", nil];
//    for(NSString *key in dic){  
//        id value = [dic valueForKey:key];  
//        if([value isKindOfClass:[NSNumber class]]){  
//            const char * pObjCType = [((NSNumber*)value) objCType];  
//            if (strcmp(pObjCType, @encode(int))  == 0) {  
//                NSLog(@"字典中key=%@的值是int类型,值为%d",key,[value intValue]);  
//            }  
//            if (strcmp(pObjCType, @encode(float)) == 0) {  
//                NSLog(@"字典中key=%@的值是float类型,值为%f",key,[value floatValue]);  
//            }  
//            if (strcmp(pObjCType, @encode(double))  == 0) {  
//                NSLog(@"字典中key=%@的值是double类型,值为%f",key,[value doubleValue]);  
//            }  
//            if (strcmp(pObjCType, @encode(BOOL)) == 0) {  
//                NSLog(@"字典中key=%@的值是bool类型,值为%i",key,[value boolValue]);  
//            }  
//        }  
//  
//    }
//      NSLog(@"int        : %s", @encode(int));
//  NSLog(@"float      : %s", @encode(float));
//  NSLog(@"float *    : %s", @encode(float*));
//  NSLog(@"char       : %s", @encode(char));
//  NSLog(@"char *     : %s", @encode(char *));
//  NSLog(@"BOOL       : %s", @encode(BOOL));
//  NSLog(@"void       : %s", @encode(void));
//  NSLog(@"void *     : %s", @encode(void *));
//
//  NSLog(@"NSObject * : %s", @encode(NSObject *));
//  NSLog(@"NSObject   : %s", @encode(NSObject));
//  NSLog(@"[NSObject] : %s", @encode(typeof([NSObject class])));
//  NSLog(@"NSError ** : %s", @encode(typeof(NSError **)));
//
//  int intArray[5] = {1, 2, 3, 4, 5};
//  NSLog(@"int[]      : %s", @encode(typeof(intArray)));
//
//  float floatArray[3] = {0.1f, 0.2f, 0.3f};
//  NSLog(@"float[]    : %s", @encode(typeof(floatArray)));
//
//  typedef struct _struct {
//      short a;
//      long long b;
//      unsigned long long c;
//  } Struct;
//  NSLog(@"struct     : %s", @encode(typeof(Struct)));
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)test2
{
   NSLog(@"test2");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
