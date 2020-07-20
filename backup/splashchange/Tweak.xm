@interface NSUserDefaults (SplashChange)
-(id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
-(void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

@interface FBSystemService : NSObject
+(id)sharedInstance;
-(void)exitAndRelaunch:(bool)arg1;
@end

@interface SBFullscreenZoomView : UIView
@end

NSString* const imagesDomain = @"com.idevicehacked.splashchangeprefs";
NSData* data = [[NSUserDefaults standardUserDefaults] objectForKey:@"backgroundImage" inDomain:imagesDomain];
UIImage* bgImage = [UIImage imageWithData:data];

static UIImageView *imageView = nil;

%hook SBFullscreenZoomView

-(void)addSubview:(UIImageView *)arg1 {
     if (!imageView) {
         imageView = [[UIImageView alloc] initWithImage:bgImage];
         imageView.frame = arg1.bounds;
        arg1 = imageView;
    }
    %orig;
}

%end

static void RespringDevice() {
    [[%c(FBSystemService) sharedInstance] exitAndRelaunch:YES];
}

%ctor {

	 CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)RespringDevice, CFSTR("com.idevicehacked.splashchangeprefs/respring"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);


}