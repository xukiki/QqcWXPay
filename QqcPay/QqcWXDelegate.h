//
//  QqcWXDelegate.h
//  QqcPay
//
//  Created by qiuqinchuan on 16/1/14.
//  Copyright © 2016年 Qqc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"
#import "QqcPaySDK.h"

@interface QqcWXDelegate : NSObject<WXApiDelegate>

- (instancetype)initWithRetBlock:(QqcPayRetBlock)block;

@end
