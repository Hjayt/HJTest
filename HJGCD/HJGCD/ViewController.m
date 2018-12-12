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
    dispatch_async(serialQueue, ^{
       --self.ticktCount ;
        NSLog(@"%@ ----- %ld",[NSThread currentThread] , self.ticktCount);
    });
    
    
    
    dispatch_async(serialQueue, ^{
        --self.ticktCount ;
        NSLog(@"%@ ----- %ld",[NSThread currentThread] , self.ticktCount);
    });
    

    dispatch_async(serialQueue, ^{
        --self.ticktCount ;
        NSLog(@"%@ ----- %ld",[NSThread currentThread] , self.ticktCount);
    });
    
    dispatch_async(serialQueue, ^{
        --self.ticktCount ;
        NSLog(@"%@ ----- %ld",[NSThread currentThread] , self.ticktCount);
    });
    
    dispatch_async(serialQueue, ^{
        --self.ticktCount ;
        NSLog(@"%@ ----- %ld",[NSThread currentThread] , self.ticktCount);
    });
    
    
    //2 异步执行并发队列
//    dispatch_async(concurrentQueue, ^{
//
//    });
//
    
    
    //3 同步执行串行队列 ： 3.1 新建的串行队列 3.2 主线程队列
    //3.1 新建的串行队列
//    dispatch_sync(serialQueue, ^{
//
//    });
    
    
    //3.2 主线程队列
//    dispatch_sync(dispatch_get_main_queue(), ^{
//
//    });
//
    
    
    //4 同步执行并行队列
//    dispatch_sync(concurrentQueue, ^{
//
//    });
//
//
    
    
    
    
    
    
    
    
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
