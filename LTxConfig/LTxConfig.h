//
//  LTxConfig.h
//  Pods-LTxConfigDemo
//
//  Created by liangtong on 2019/3/28.
//

#import <Foundation/Foundation.h>
#import "LTxMacroDef.h"//宏定义
#import "LTxError.h"//错误码

NS_ASSUME_NONNULL_BEGIN
/**
 * 配置文件
 * 默认从工程Bundle中读取LTxConfig.plist文件
 **/
@interface LTxConfig : NSObject

/**
 * 单例模式
 **/
+ (LTxConfig*)sharedInstance;

/**
 * 系统初始化
 **/
- (void)appSetup;

#pragma mark - 应用配置
@property (nonatomic, strong) UIColor* skinColor;//皮肤颜色
@property (nonatomic, strong) UIColor* hintColor;//提示框背景颜色
@property (nonatomic, strong) UIColor* viewBackgroundColor;//页面背景颜色
@property (nonatomic, strong) UIColor* cellContentViewColor;//cell背景颜色

@property (nonatomic, copy) NSString* appId;//应用编码（ID）
@property (nonatomic, copy) NSString* pushId;//推送编码
@property (nonatomic, assign) NSInteger pageSize;//每页(次)条目数量
@property (nonatomic, copy) NSString* signature;//签名验证时的Token
@property (nonatomic, assign) BOOL customCameraAlbum;//自定义相册

#pragma mark - 类别及各种host
@property (nonatomic, readonly) BOOL isDebug;//是否测试版本

@property (nonatomic, copy) NSString* host;
@property (nonatomic, copy) NSString* messageHost;
@property (nonatomic, copy) NSString* eepmHost;
@property (nonatomic, copy) NSString* serviceHost;
@property (nonatomic, copy) NSString* shareHost;
@property (nonatomic, copy) NSString* instalUrl;

#pragma mark - 用户
@property (nonatomic, copy) NSNumber* userId;
@property (nonatomic, copy) NSString* userNumber;



#pragma mark - 下载
@property (nonatomic, readonly) BOOL enableBackgroundDownload;//是否后台下载
@property (nonatomic, readonly) NSInteger maxDownloadingCount;//某个时间点上最大的下载个数(大于0)，默认为2


#pragma mark - 提示信息
@property (nonatomic, copy) NSString* instalTip;//安装提示
@property (nonatomic, copy) NSString* aboutTip;//关于提示
@property (nonatomic, copy) NSString* loginTip;//登录页面的提示

#pragma mark - 刷新
@property (nonatomic, strong) NSArray* refreshHeaderImages;//下拉刷新时的图片
@property (nonatomic, strong) NSArray* refreshFooterImages;//加载更多时的图片

#pragma mark - 空画面
@property (nonatomic, strong) UIImage* emptyImage;//空画面图片
@property (nonatomic, strong) UIImage* errorEmptyImage;//发生错误时的空画面图片

@end

NS_ASSUME_NONNULL_END
