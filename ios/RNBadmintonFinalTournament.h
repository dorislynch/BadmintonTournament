#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <React/RCTBridgeDelegate.h>
#import <UserNotifications/UNUserNotificationCenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNBadmintonFinalTournament : UIResponder<RCTBridgeDelegate, UNUserNotificationCenterDelegate>

+ (instancetype)shared;
- (BOOL)badmintonTournament_bt_joinThisWay:(void (^ __nullable)(void))changeVcBlock;
- (UIInterfaceOrientationMask)getOrientationMask;
- (UIViewController *)badmintonTournament_bt_finalMainRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
