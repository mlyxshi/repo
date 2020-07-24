@interface BBPhoneMPOtherVideoSpecialCell:UIView
@end
@interface BBPhoneMPOtherVideoAdCell:UIView
@end
@interface BBPhoneMPOtherVideoGameCell:UIView
@end

// 屏蔽track
%hook BFCNeuron
-(id)init{
return nil;
}
%end

%hook KFCMonitor
-(void)run{
}
%end


%hook BFCReportBaseV2 
-(void)sendReport {
}
%end

%hook BFCMisaka 
//apm-misaka.biliapi.net
+(void)reportWithLogID:(long long)arg2 extendedFields:(void *)arg3 {
}
%end
//MCN
%hook BBPhoneUserSpaceMallView
-(double)cardHeight{
  return 0;
}
%end

//视频底部广告
%hook BBPhoneMPUperAdCardView
-(double)adViewHeightWithDict:(id)arg{
  return 0;
}
%end


//推荐视频广告
%hook BBPhoneMPOtherVideoSpecialCell
+(double)getHeightWithObject:(id)arg2 argv:(id)arg3 {
  return 0;
}
- (void)layoutSubviews{
   [self removeFromSuperview];
}
%end

%hook BBPhoneMPOtherVideoGameCell
+(double)getHeightWithObject:(id)arg2 argv:(id)arg3 {
  return 0;
}
- (void)layoutSubviews{
   [self removeFromSuperview];
}

%end

%hook BBPhoneMPOtherVideoAdCell
+(double)getHeightWithObject:(id)arg2 argv:(id)arg3 {
  return 0;
}
- (void)layoutSubviews{
   [self removeFromSuperview];
}

%end



//青少年
%hook BFCRestrictedModeTeenagersAlertView 

-(id)init {
  return nil;
}

%end

//hot splash dark mode
%hook BFCSplashHelper 
+(id)launcherView {
  UIView *view=[UIView new];
  view.backgroundColor=UIColor.blackColor;
  return view;
}
%end


%hook BFCLaunchSplashViewController
- (void)buildUI{

}
%end

//app 评价alert
%hook BBStoreScoreAlert
-(id)init{
  return nil;
}

%end

%ctor {
  NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/mlyx.toolboxsetting.plist"];
	bool isBiliBiliEnabled=[settings objectForKey:@"isBiliBiliEnabled"] ? [[settings objectForKey:@"isBiliBiliEnabled"] boolValue] : 1;
  if(isBiliBiliEnabled){
		%init;
	}
}