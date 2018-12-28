//
//  HJAsyncSerialViewController.m
//  HJGCD
//
//  Created by 谢豪杰 on 2018/12/26.
//  Copyright © 2018 Hjay. All rights reserved.
//

#import "HJGCDViewController.h"

@interface HJGCDViewController ()

@property (nonatomic , strong) UIButton * runBtn;

@property (nonatomic , strong) UITextView * logTextView;

@property (nonatomic , copy) NSString * log;

@property (nonatomic , assign) long ticktCount;

@property (nonatomic , strong) dispatch_queue_t serialQueue;

@property (nonatomic , strong) dispatch_queue_t concurrentQueue;

@end

@implementation HJGCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    _ticktCount = 10;
    _log = @"";
    [self.view addSubview:self.runBtn];
    [self.view addSubview:self.logTextView];
}

#pragma mark-
#pragma mark- Event
- (void)pressRunBtnAction:(UIButton *)btn {
    _log = @"";
    _ticktCount = 10;
    for (int i = 0; i < 5; i++) {
        switch (self.GCDType) {
            case HJGCDTypeAsyncSync:
            {
                [self runGCDAsyncSyncFoundation];
            }
                break;
                
            case HJGCDTypeSyncAsync:
            {
                [self runGCDSyncAsyncFoundation];
            }
                break;
                
            case HJGCDTypeSyncMainQueue:
            {
                [self runGCDSyncMainQueue];
            }
                break;
                
            case HJGCDTypeAsyncMainQueue:
            {
                [self runGCDAsyncMainQueue];
            }
                break;
            
            case HJGCDTypeSyncSerialQueue:
            {
                [self runGCDSyncSerialQueue];
            }
                break;
                
            case HJGCDTypeAsyncSerialQueue:
            {
                [self runGCDASyncSerialQueue];
            }
                break;
            
            case HJGCDTypeSyncConcureenQueue:
            {
                [self runGCDSyncConcurrentQueue];
            }
                break;
                
            case HJGCDTypeAsyncConcurrenQueue:
            {
                [self runGCDAsyncConcurrentQueue];
            }
                break;
                
            default:
                break;
        }
    }
    
}


#pragma mark-
#pragma mark- Private method
- (void)runGCDAsyncConcurrentQueue {
    
    dispatch_async(self.concurrentQueue, ^{
        [self buyTicket];
    });
    
}

- (void)runGCDASyncSerialQueue {
    dispatch_async(self.serialQueue, ^{
        [self buyTicket];
    });
}

- (void)runGCDAsyncMainQueue {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self buyTicket];
    });
}

- (void)runGCDSyncConcurrentQueue {

    dispatch_sync(self.concurrentQueue, ^{
        [self buyTicket];
    });
}

- (void)runGCDSyncSerialQueue {
    dispatch_sync(self.serialQueue, ^{
        [self buyTicket];
    });
}

- (void)runGCDSyncMainQueue {
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self buyTicket];
    });
}

- (void)runGCDAsyncSyncFoundation {
    
}

- (void)runGCDSyncAsyncFoundation {
    
}


- (void)buyTicket {
    //    dispatch_barrier_async(dispatch_get_global_queue(0, 0), ^{
//    sleep(1);
    _ticktCount --;
    self.log = [NSString stringWithFormat:@"%@\nticket count ----%ld  %@\n",self.log ,_ticktCount,[NSThread currentThread]];
    
}

#pragma mark-
#pragma mark- Setter && Getter

- (UIButton *)runBtn {
    if (!_runBtn) {
        _runBtn = [[UIButton alloc] initWithFrame:CGRectMake(40, 80, 100, 40)];
        [_runBtn addTarget:self action:@selector(pressRunBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_runBtn setTitle:@"Run Task" forState:UIControlStateNormal];
        [_runBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _runBtn.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.1];
        _runBtn.layer.cornerRadius = 20;
    }
    return _runBtn;
}

- (UITextView *)logTextView {
    if (!_logTextView) {
        _logTextView = [[UITextView alloc] initWithFrame:CGRectMake(30.f , 200, self.view.frame.size.width - 60.f, 300)];
        _logTextView.layer.cornerRadius = 3.f;
        _logTextView.layer.masksToBounds = YES;
        _logTextView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.1];
    }
    return _logTextView;
}

- (dispatch_queue_t)serialQueue {
    if (!_serialQueue) {
        _serialQueue  = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);
    }
    return _serialQueue;
}

- (dispatch_queue_t)concurrentQueue {
    if (!_concurrentQueue) {
        _concurrentQueue = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
    }
    return _concurrentQueue;
}

- (void)setLog:(NSString *)log {
    _log = log;
    dispatch_async(dispatch_get_main_queue(), ^{
        self.logTextView.text = self -> _log;
    });
}

- (void)dealloc {
    NSLog(@"------ i will dealloc ---------");
}

@end
