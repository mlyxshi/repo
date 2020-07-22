  
#import "MediaRemote.h"

%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)arg1 {
  %orig;
  NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
  [notificationCenter addObserver:self selector:@selector(updateImage:) name:(__bridge NSString *)kMRMediaRemoteNowPlayingApplicationDidChangeNotification object:nil];

}

%new
-(void)updateImage:(NSNotification *)notification {
NSLog(@"mlyx noti1 %@",notification);
NSLog(@"mlyx noti2 %@",notification.userInfo);
NSLog(@"mlyx noti3 %@",[notification.userInfo  objectForKey:@"kMRMediaRemoteNowPlayingApplicationDisplayNameUserInfoKey"]);
}

%end






// @interface SBMediaController : NSObject
// @property (nonatomic, weak,readonly) id nowPlayingApplication;
// +(id)sharedInstance;
// -(void)_setNowPlayingApplication:(id)arg1 ;
// -(void)_nowPlayingAppDidExit:(id)arg1 ;
// @end


// // %hook _UIStatusBarBluetoothItem

// // //airpods 连接进耳朵时的动画
// // -(id)additionAnimationForDisplayItemWithIdentifier:(id)arg1 {
// //         //如果当前没media应用，就开启网易云私人FM
// //     if (![[%c(SBMediaController) sharedInstance] nowPlayingApplication]) { 
// // 		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"orpheuswidget://radio"] options:@{} completionHandler:nil];         
// //     }
// //     return %orig;
// // }

// // %end

// SBMediaController* all;
// [all addObserver:self forKeyPath:@"nowPlayingApplication" options:NSKeyValueObservingOptionNew context:nil];

// %hook SBMediaController
// +(id)sharedInstance{
//   all =%orig;

//   NSLog(@"mlyx 注入");
//   return %orig;
// }

// -(void)dealloc
// {
//     // 移除监听
//     %orig;
//     NSLog(@"mlyx 结束");
//     [self removeObserver:self forKeyPath:@"nowPlayingApplication"];
// }

// %new
// - (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
//     NSLog(@"mlyx 监听到属性值改变了");
//     NSLog(@"keyPath : %@, object : %@, change : %@", keyPath, object, change);
// }

// %end





