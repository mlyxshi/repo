@interface SBCoverSheetPresentationManager: NSObject
+ (id)sharedInstance;
- (BOOL)_isEffectivelyLocked;
- (BOOL)isPresented;
@end

@interface SBControlCenterController: NSObject
+ (id)sharedInstance;
- (BOOL)isVisible;
@end

@interface NetworkSpeed: NSObject
{
    UIWindow *networkSpeedWindow;
    UILabel *networkSpeedLabel;
    UIColor *backupForegroundColor;
    UIColor *backupBackgroundColor;
    SBCoverSheetPresentationManager *coverSheetPresentationManagerInstance;
    SBControlCenterController *controlCenterControllerInstance;
}
- (id)init;
- (void)updateOrientation;
- (void)updateFrame;
- (void)updateNetworkSpeedLabelSize;
- (void)updateTextColor:(UIColor *)color;
- (void)openDoubleTapApp;
- (void)openHoldApp;
- (void)hideIfNeeded;
@end

@interface UIScreen ()
- (CGRect)_referenceBounds;
@end

@interface UIWindow ()
- (void)_setSecure:(BOOL)arg1;
@end

@interface SBApplication: NSObject
-(NSString*)bundleIdentifier;
@end

@interface SpringBoard: UIApplication
- (id)_accessibilityFrontMostApplication;
-(void)frontDisplayDidChange: (id)arg1;
@end

@interface UIApplication ()
- (UIDeviceOrientation)_frontMostAppOrientation;
- (BOOL)launchApplicationWithIdentifier:(id)arg1 suspended:(BOOL)arg2;
@end

@interface _UIStatusBarStyleAttributes : NSObject
@property(nonatomic, copy) UIColor *imageTintColor;
@end

@interface _UIStatusBar : UIView
@property(nonatomic, retain) _UIStatusBarStyleAttributes *styleAttributes;
@end

@interface UIApplication ()
- (BOOL)launchApplicationWithIdentifier:(id)arg1 suspended:(BOOL)arg2;
@end