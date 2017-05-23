//
//  QqcWXPay.h
//  QqcWXPay
//
//  Created by qiuqinchuan on 16/1/14.
//  Copyright © 2016年 Qqc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QqcSingletonTemplate.h"

@interface QqcWXPayRet : NSObject

@property(nonatomic, copy)NSString* strRetCode;
@property(nonatomic, copy)NSString* strRetMsg;
@property(nonatomic, strong)id cstmObj;

@end

typedef void(^QqcWXPayRetBlock)(QqcWXPayRet* retObj);

@interface QqcWXPay : NSObject

single_interface_qqc(QqcWXPay);

/**
 *  初始化支付SDK
 *
 *  @param appId 微信开发者ID
 */
- (void)connectSdkWithAppId:(NSString *)appId;

/**
 *  支付回调传递处理，在下面的三个代理函数中调用
 *  - (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url;
 *  - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;
 *  - (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options;
 *
 *  @param url 来自上面 AppDelegate 代理函数中的url参数
 *
 *  @return 成功返回YES，失败返回NO
 */
- (BOOL)handleWXOpenUrl:(NSURL*)url;

/**
 *  微信支付
 *
 *  @param dicParam 支付接口参数（该参数来自服务器）
 *  {
 *      @"appid":@"微信分配的公众账号ID"
 *      @"partnerid":@"微信支付分配的商户号"
 *      @"prepayid":@"微信返回的支付交易会话ID"
 *      @"package":@"暂填写固定值Sign=WXPay"
 *      @"noncestr":@"随机字符串，不长于32位。推荐随机数生成算法"
 *      @"timestamp":@"时间戳"
 *      @"sign":@"签名"
 *  }
 *
 *  @param block 结果回调block
 */
- (void)wxPay:(NSDictionary*)dicParam payRetBlock:(QqcWXPayRetBlock)block;

@end
