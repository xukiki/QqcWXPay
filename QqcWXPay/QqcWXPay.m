//
//  QqcWXPay.m
//  QqcWXPay
//
//  Created by qiuqinchuan on 16/1/14.
//  Copyright © 2016年 Qqc. All rights reserved.
//

#import "QqcWXPay.h"
#import "QqcWXDelegate.h"
#import "QqcLog.h"

@implementation QqcWXPayRet

@end

@interface QqcWXPay()

@property(nonatomic, copy)QqcWXPayRetBlock blockWXRet;
@property(nonatomic, strong)QqcWXDelegate* qqcwxDelegate;

@property(nonatomic, copy)QqcWXPayRetBlock blockAliRet;

@end

@implementation QqcWXPay

single_implementation_qqc(QqcWXPay)

- (void)dealloc
{
    _blockWXRet = nil;
    _qqcwxDelegate = nil;
    
    QqcDebugLog(@"%@-%s",NSStringFromClass(self.class), __FUNCTION__);
}

- (QqcWXDelegate *)qqcwxDelegate
{
    if (nil == _qqcwxDelegate)
    {
        _qqcwxDelegate = [[QqcWXDelegate alloc] initWithRetBlock:_blockWXRet];
    }
    
    return _qqcwxDelegate;
}

- (void)connectSdkWithAppId:(NSString *)appId description:(NSString *)strDesc
{
    //向微信注册
    [WXApi registerApp:appId withDescription:strDesc];
}

- (BOOL)handleWXOpenUrl:(NSURL*)url
{
    return [WXApi handleOpenURL:url delegate:self.qqcwxDelegate];
}

- (void)wxPay:(NSDictionary*)dicParam payRetBlock:(QqcWXPayRetBlock)block
{
    _blockWXRet = block;
    _qqcwxDelegate = nil;
    //============================================================
    // V3&V4支付流程实现
    // 注意:参数配置请查看服务器端Demo
    // 更新时间：2015年11月20日
    //============================================================
    NSMutableString *stamp  = [dicParam objectForKey:@"timestamp"];
    
    //调起微信支付
    PayReq* req             = [[PayReq alloc] init];
    req.partnerId           = [dicParam objectForKey:@"partnerid"];
    req.prepayId            = [dicParam objectForKey:@"prepayid"];
    req.nonceStr            = [dicParam objectForKey:@"noncestr"];
    req.timeStamp           = stamp.intValue;
    req.package             = [dicParam objectForKey:@"package"];
    req.sign                = [dicParam objectForKey:@"sign"];
    [WXApi sendReq:req];
    //日志输出
    NSLog(@"appid=%@\npartid=%@\nprepayid=%@\nnoncestr=%@\ntimestamp=%ld\npackage=%@\nsign=%@",[dicParam objectForKey:@"appid"],req.partnerId,req.prepayId,req.nonceStr,(long)req.timeStamp,req.package,req.sign);
}

@end
