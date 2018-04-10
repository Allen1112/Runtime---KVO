//
//  ViewController.m
//  Runtime---KVO
//
//  Created by xiaomeng on 2016/1/12.
//  Copyright © 2016年 xiaomeng. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+KVO.h"
#import "Dog.h"
@interface ViewController ()
@property (nonatomic, strong) Dog *dog;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    Dog *dog = [[Dog alloc] init];
    _dog = dog;
    _dog.name = @"HH";
    
    // 添加观察者
    [_dog XM_addObserver:self forKey:@"name" withBlock:^(id observedObject, NSString *observedKey, id oldValue, id currentValue) {
        NSLog(@"旧值 = %@ 新值 = %@",oldValue,currentValue);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSArray *msgs = @[@"算法导论", @"Objective C", @"Swift", @"操作系统", @"数据结构", @"Java编程", @"编程之美"];
    NSUInteger index = arc4random_uniform((u_int32_t)msgs.count);
    _dog.name = msgs[index];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //移除观察者
    [_dog XM_removeObserver:self forKey:@"name"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
