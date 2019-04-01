//
//  LTxConfig.m
//  Pods-LTxConfigDemo
//
//  Created by liangtong on 2019/3/28.
//

#import "LTxConfig.h"
@interface LTxConfig()
@property (nonatomic, readwrite) BOOL isDebug;

@property (nonatomic, assign, readwrite) BOOL enableBackgroundDownload;//后台下载
@property (nonatomic, assign, readwrite) NSInteger maxDownloadingCount;//最大下载数量
@end
@implementation LTxConfig
/**
 * 单例模式
 **/
static LTxConfig *_instance;
+ (LTxConfig*)sharedInstance{
    static dispatch_once_t onceTokenLTxConfig;
    dispatch_once(&onceTokenLTxConfig, ^{
        _instance = [[LTxConfig alloc] init];
        [_instance setupInitConfigValues];
    });
    
    return _instance;
}

/**
 * 系统初始化
 **/
- (void)appSetup{
    //NavigationBar 字体颜色
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
    [[UINavigationBar appearance] setBarTintColor:_skinColor];
}

/*默认设置*/
-(void)setupInitConfigValues{
    /*颜色*/
    _skinColor = [UIColor colorWithRed:59/255.0 green:145/255.0 blue:233/255.0 alpha:1];
    _hintColor = [UIColor colorWithRed:240/255.0 green:173/255.0 blue:78/255.0 alpha:1];
    _viewBackgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];
    _cellContentViewColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1];
  
    /*配置参数*/
    NSURL* configFileURL = [[NSBundle mainBundle] URLForResource:@"LTxConfig" withExtension:@"plist"];
    if (configFileURL) {
        NSDictionary* configDic = [NSDictionary dictionaryWithContentsOfURL:configFileURL];
        NSString* type = [configDic objectForKey:@"type"];
        
        //类别及各种host
        _isDebug = [type isEqualToString:@"debug"];
        NSDictionary* typeDic = [configDic objectForKey:type];
        _host = [typeDic objectForKey:@"host"];
        _instalUrl = [typeDic objectForKey:@"instalUrl"];
        
        //应用配置
        _appId = [configDic objectForKey:@"appId"];
        _pushId = [configDic objectForKey:@"pushId"];
        _pageSize = [[configDic objectForKey:@"pageSize"] integerValue];
        _customCameraAlbum = [[configDic objectForKey:@"customCameraAlbum"] boolValue];
        _signature = [configDic objectForKey:@"signature"];
        
        
        //下载
        NSDictionary* downloadConfig = [configDic objectForKey:@"download"];
        _enableBackgroundDownload = [[downloadConfig objectForKey:@"backgroundDownload"] boolValue];
        _maxDownloadingCount = [[downloadConfig objectForKey:@"maxDownloadingCount"] integerValue];
        
        
        //提示信息
        NSDictionary* tipsDic = [configDic objectForKey:@"tips"];
        _instalTip = [tipsDic objectForKey:@"instalTip"];
        _aboutTip = [tipsDic objectForKey:@"aboutTip"];
        _loginTip = [tipsDic objectForKey:@"loginTip"];
        
        
        //刷新
        NSDictionary* refreshDic = [configDic objectForKey:@"refresh"];
        _refreshHeaderImages = [refreshDic objectForKey:@"header"];
        _refreshFooterImages = [refreshDic objectForKey:@"footer"];
        
        //空画面
        NSDictionary* emptyDic = [configDic objectForKey:@"empty"];
        _emptyImage = LTxImageWithName([emptyDic objectForKey:@"empty_image"]);
        _errorEmptyImage =  LTxImageWithName([emptyDic objectForKey:@"error_image"]);
        
    }else{//默认配置
        /*类别及各种host*/
        _host = @"http://192.168.1.75:8801/eepj-base-login";
        _instalUrl = @"http://192.168.1.75:8801/eepm";
        
        /*应用配置*/
        _appId = @"";
        _pushId = @"";
        _pageSize = 20;
        _customCameraAlbum = YES;
        _signature = nil;
        
        /*下载*/
        _enableBackgroundDownload = NO;
        _maxDownloadingCount = 2;
        
        /*提示信息*/
        _instalTip = @"在苹果设备上安装的重要提示：\
        \n1.扫码后,确保“切换到苹果自带的Safari浏览器打开网页”，方能成功安装！\
        \n2.针对iOS9及以上版本的用户，打开本应用时你可能会收到“未受信任的企业级开发者”的提示。此时，你需按照以下步骤手工完成设置（苹果官方最新安全要求）：进入[设置]>[通用]>[描述文件]>[企业级应用]>[Sippr Enginnering Group Co., LTD.]，点击“信任...”或进入[设置]>[通用]>[设备管理]>[Sippr Enginnering Group Co., LTD.]，点击“信任...”。";
        _aboutTip = @"本应用包含极光推送，版权所有(c) 2012, 深圳市和讯华谷信息技术有限公司。";
        _loginTip = @"";
        
        /*刷新*/
        _refreshHeaderImages = @[];
        _refreshFooterImages = @[];
        
        /*空画面*/
        _emptyImage = LTxImageWithName(@"ic_view_empty");
        _errorEmptyImage = LTxImageWithName(@"ic_view_error_empty");
    }
    
    
}
@end
