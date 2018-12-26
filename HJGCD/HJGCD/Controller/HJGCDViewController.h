//
//  HJAsyncSerialViewController.h
//  HJGCD
//
//  Created by 谢豪杰 on 2018/12/26.
//  Copyright © 2018 Hjay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger , HJGCDType) {
    HJGCDTypeAsyncConcurrenQueue,
    HJGCDTypeAsyncSerialQueue,
    HJGCDTypeAsyncMainQueue,
    HJGCDTypeSyncSerialQueue,
    HJGCDTypeSyncMainQueue,
    HJGCDTypeSyncConcureenQueue,
    HJGCDTypeAsyncSync,
    HJGCDTypeSyncAsync,
    
};

@interface HJGCDViewController : UIViewController

@property (nonatomic , assign) HJGCDType GCDType;

@end

NS_ASSUME_NONNULL_END
