//
//  QqcWXDelegate.m
//  QqcPay
//
//  Created by qiuqinchuan on 16/1/14.
//  Copyright © 2016年 Qqc. All rights reserved.
//

#import "QqcWXDelegate.h"
#import "QqcLog.h"

@interface QqcWXDelegate()

@property(nonatomic, copy)QqcWXPayRetBlock retBlock;

@end

@implementation QqcWXDelegate

- (instancetype)initWithRetBlock:(QqcWXPayRetBlock)block
{
    self = [super init];
    if (self)
    {
        _retBlock = block;
    }
    
    return self;
}

-(void)dealloc
{
    QqcDebugLog(@"%@-%s",NSStringFromClass(self.class), __FUNCTION__);
    _retBlock = nil;
}

#pragma mark - WXApiDelegate
- (void)onResp:(BaseResp *)resp
{
    if([resp isKindOfClass:[PayResp class]])
    {
        //支付返回结果，实际支付结果需要去微信服务器端查询
        QqcWXPayRet* qqcPayRet = [[QqcWXPayRet alloc] init];
        
        qqcPayRet.strRetCode = [NSString stringWithFormat:@"%d", resp.errCode];
        
        switch (resp.errCode)
        {
            case WXSuccess:
                qqcPayRet.strRetMsg = @"支付结果：成功！";
                break;
            default:
                qqcPayRet.strRetMsg = resp.errStr;
                break;
        }
        
        _retBlock ? _retBlock(qqcPayRet) : NSLog(@"微信支付回调block为nil!!!");
    }
}

@end
