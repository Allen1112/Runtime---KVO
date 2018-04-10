//
//  NSObject+KVO.h
//  Runtime---KVO
//
//  Created by xiaomeng on 2016/1/12.
//  Copyright © 2016年 xiaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * @param observedObject asd 需要被观察的对象
 * @param observedKey 观察的属性
 * @param oldValue 属性旧值
 * @param currentValue 属性新值
 */
typedef void(^XMObservingBlock)(id observedObject, NSString * observedKey, id oldValue, id currentValue);

@interface NSObject (KVO)

/**
 * 添加观察者
 * @param observer 需要添加的观察者
 * @param keyPath 观察的属性
 * @param block 属性变化后执行的回调
*/
- (void)XM_addObserver:(NSObject *)observer forKey:(NSString *)keyPath withBlock:(XMObservingBlock)block;

/**
 * 移除观察者
 * @param observer 需要移除的观察者
 * @param key 观察的属性
 */
- (void)XM_removeObserver:(NSObject *)observer forKey:(NSString *)key;

@end
