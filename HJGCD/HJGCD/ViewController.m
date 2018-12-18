//
//  ViewController.m
//  HJGCD
//
//  Created by 谢豪杰 on 2018/11/9.
//  Copyright © 2018年 Hjay. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@property (nonatomic , assign) long ticktCount;

@property (nonatomic , strong)     dispatch_semaphore_t  lock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ticktCount = 10;
    
    //   函数执行分两种；异步执行，同步执行， 队列分为两种 ：串行队列，并发队列   两种结合有 C42 种场景
    dispatch_queue_t  serialQueue = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t  concurrentQueue = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
    
    //1 异步执行串行队列
//    dispatch_async(serialQueue, ^{
//       --self.ticktCount ;
//        NSLog(@"%@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
//
//
//
//    dispatch_async(serialQueue, ^{
//        --self.ticktCount ;
//        NSLog(@"%@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
//
//
//    dispatch_async(serialQueue, ^{
//        --self.ticktCount ;
//        NSLog(@"%@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
//
//    dispatch_async(serialQueue, ^{
//        --self.ticktCount ;
//        NSLog(@"%@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
//
//    dispatch_async(serialQueue, ^{
//        --self.ticktCount ;
//        NSLog(@"%@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
    
    
    //2 异步执行并发队列
//    dispatch_async(concurrentQueue, ^{
//
//        --self.ticktCount ;
//        NSLog(@"task 1  %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
//
//    dispatch_async(concurrentQueue, ^{
//
//        --self.ticktCount ;
//        NSLog(@"task 2 %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
//
//    dispatch_async(concurrentQueue, ^{
//
//        --self.ticktCount ;
//        NSLog(@"task 3 %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
//
//    dispatch_async(concurrentQueue, ^{
//
//        --self.ticktCount ;
//        NSLog(@"task 4 %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
//
//    dispatch_async(concurrentQueue, ^{
//
//        --self.ticktCount ;
//        NSLog(@"task 5  %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
    
    //3 同步执行串行队列 ： 3.1 新建的串行队列 3.2 主线程队列
    //3.1 新建的串行队列 ，首先判断目标队列是否有没完成的事情，如果有则等完成才能invoke 只是添加到队列，然后
    dispatch_sync(serialQueue, ^{
        --self.ticktCount ;
        NSLog(@"task 1  %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
    });

    dispatch_sync(serialQueue, ^{
        --self.ticktCount ;
        NSLog(@"task 2  %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
    });

    dispatch_sync(serialQueue, ^{
        --self.ticktCount ;
        NSLog(@"task 3  %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
    });
    
    //3.2 主线程队列 crash 造成主线程死锁
//    dispatch_sync(dispatch_get_main_queue(), ^{
//
//    });
    // 在执行函数的时候就崩掉了
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        --self.ticktCount ;
//        NSLog(@"task 1  %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
//
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        --self.ticktCount ;
//        NSLog(@"task 2  %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
//
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        --self.ticktCount ;
//        NSLog(@"task 3  %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
//
    
    
    //4 同步执行并行队列 把blog的东西加到主线程队列，然后直接执行掉，后面的调用还没有加到队列中来不存在资源争抢的问题
//    dispatch_sync(concurrentQueue, ^{
//        --self.ticktCount ;
//        NSLog(@"task 1  %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
//
//    dispatch_sync(concurrentQueue, ^{
//        --self.ticktCount ;
//        NSLog(@"task 2  %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
//
//    dispatch_sync(concurrentQueue, ^{
//        --self.ticktCount ;
//        NSLog(@"task 3  %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
//
//    dispatch_sync(concurrentQueue, ^{
//        --self.ticktCount ;
//        NSLog(@"task 4  %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });

    
    
    
    
    
    
    
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        for (int i = 0; i < 10; i++) {
//                        sleep(1);
//                        [self buyTicket];
//                        NSLog(@"buyerd ticket count ---- %ld",self->_ticktCount);
//            NSLog(@"%@",[NSThread currentThread]);
//                    }
//
//    });
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        for (int i = 0; i < 10; i++) {
//            sleep(1);
//            [self buyTicket];
//            NSLog(@"buyerd ticket count ---- %ld",self->_ticktCount);
//
//        }
//
//
//    });
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        for (int i = 0; i < 10; i++) {
//            sleep(1);
//            [self buyTicket];
//            NSLog(@"buyerd ticket count ---- %ld",self->_ticktCount);
//
//        }
//
//
//    });
}


- (void)buyTicket {
    
//    dispatch_barrier_async(dispatch_get_global_queue(0, 0), ^{
    dispatch_semaphore_wait(self.lock, 2);
        self->_ticktCount --;
        NSLog(@"ticket count ---- %ld ,%@",self->_ticktCount,[NSThread currentThread]);
//    });
    dispatch_semaphore_signal(self.lock);
  
    
}

- (dispatch_semaphore_t)lock {
    if(!_lock){
        _lock = dispatch_semaphore_create(1);
    }
    return _lock;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
