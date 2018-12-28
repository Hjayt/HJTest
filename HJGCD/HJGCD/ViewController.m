//
//  ViewController.m
//  HJGCD
//
//  Created by 谢豪杰 on 2018/11/9.
//  Copyright © 2018年 Hjay. All rights reserved.
//

#import "ViewController.h"
#import "HJGCDViewController.h"


@interface ViewController ()
<
    UITableViewDataSource,
    UITableViewDelegate
>

@property (nonatomic , strong)  dispatch_semaphore_t  lock;

@property (nonatomic , strong) UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"GCDDemo";
    [self.view addSubview:self.tableView];
    
    
    
    
    
    
    
    
    
    //   函数执行分两种；异步执行，同步执行， 队列分为两种 ：串行队列，并发队列   两种结合有 C42 种场景
//    dispatch_queue_t  serialQueue = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t  concurrentQueue = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
    
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
//    dispatch_sync(serialQueue, ^{
//        --self.ticktCount ;
//        NSLog(@"task 1  %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
//
//    dispatch_sync(serialQueue, ^{
//        --self.ticktCount ;
//        NSLog(@"task 2  %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
//
//    dispatch_sync(serialQueue, ^{
//        --self.ticktCount ;
//        NSLog(@"task 3  %@ ----- %ld",[NSThread currentThread] , self.ticktCount);
//    });
    
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




#pragma mark-
#pragma mark- UITableviewDataSource && delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
   
    UITableViewHeaderFooterView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
    switch (section) {
            case 0:
        {
            view.textLabel.text = @"异步函数";
        }
            break;
        
            case 1:
        {
            view.textLabel.text = @"同步函数";
        }
            break;
        
            case 2:
        {
             view.textLabel.text = @"混合调用函数";
        }
            break;
            
    }
    
    return view;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    switch (indexPath.section) {
            case 0:
        {
                //异步函数
            switch (indexPath.row) {
                    case 0:
                {
                    //异步函数 目标队列：并行队列
                    cell.textLabel.text = @"并行队列";
                }
                    break;
                case 1:
                {
                    //异步函数 目标队列 ：串行队列(非主线程队列)
                    cell.textLabel.text = @"串行队列(非主线程队列)";
                }
                    break;
                
                case 2:
                {
                    //目标队列：串行队列（主线程队列）
                    cell.textLabel.text = @"串行队列(主线程队列)";
                }
                    break;
                    
            }
            
            
        }
            break;
            
            case 1:
        {
            //同步函数
            switch (indexPath.row) {
                    case 0:
                {
                    // 同步函数 目标队列 ：串行队列(非主线程队列)
                    cell.textLabel.text = @"串行队列(非主线程队列)";
                    
                }
                    break;
                    
                    case 1:
                {
                    //同步函数 目标队列 ：串行队列(主线程队列)
                    cell.textLabel.text = @"串行对列(主线程队列)";
                }
                    break;
                    
                    case 2:
                {
                    //同步函数 目标队列 ： 并行队列
                    cell.textLabel.text = @"并行队列";
                }
                    break;
                    
                default:
                    break;
            }
            
        }
            break;
            
            case 2:
        {
            // 异步同步混合
            switch (indexPath.row) {
                    case 0:
                {
                    //异步函数 block里调同步函数
                    cell.textLabel.text = @"异步函数block里调同步函数";
                }
                    break;
                    
                    case 1:
                {
                    //同步函数 block里调异步函数
                    cell.textLabel.text = @"同步函数block里调异步函数";
                }
                    break;
                    
                    
                default:
                    break;
            }
        }
            break;
            
        default:
            break;
    }
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    HJGCDViewController * vc = [[HJGCDViewController alloc] init];
    vc.title = cell.textLabel.text;
    switch (indexPath.section) {
        case 0:
        {
            //异步函数
            switch (indexPath.row) {
                case 0:
                {
                    //异步函数 目标队列：并行队列
                    vc.GCDType = HJGCDTypeAsyncConcurrenQueue;
                }
                    break;
                case 1:
                {
                    //异步函数 目标队列 ：串行队列(非主线程队列)
                    vc.GCDType = HJGCDTypeAsyncSerialQueue;

                }
                    break;
                    
                case 2:
                {
                    //目标队列：串行队列（主线程队列）
                    vc.GCDType = HJGCDTypeAsyncMainQueue;

                }
                    break;
                    
            }
            
            
        }
            break;
            
        case 1:
        {
            //同步函数
            switch (indexPath.row) {
                case 0:
                {
                    // 同步函数 目标队列 ：串行队列(非主线程队列)
                vc.GCDType = HJGCDTypeSyncSerialQueue;

                    
                }
                    break;
                    
                case 1:
                {
                    //同步函数 目标队列 ：串行队列(主线程队列)
                    vc.GCDType = HJGCDTypeSyncMainQueue;

                }
                    break;
                    
                case 2:
                {
                    //同步函数 目标队列 ： 并行队列
                    vc.GCDType = HJGCDTypeSyncConcureenQueue;

                }
                    break;
                    
                default:
                    break;
            }
            
        }
            break;
            
        case 2:
        {
            // 异步同步混合
            switch (indexPath.row) {
                case 0:
                {
                    //异步函数 block里调同步函数
                    vc.GCDType = HJGCDTypeAsyncSync;

                }
                    break;
                    
                case 1:
                {
                    //同步函数 block里调异步函数
                    vc.GCDType = HJGCDTypeSyncAsync;

                }
                    break;
                    
                    
                default:
                    break;
            }
        }
            break;
            
        default:
            break;
    }
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark-
#pragma mark- Setter && Getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 50.f;
    }
    return _tableView;
}

- (dispatch_semaphore_t)lock {
    if(!_lock){
        _lock = dispatch_semaphore_create(1);
    }
    return _lock;
}



@end
