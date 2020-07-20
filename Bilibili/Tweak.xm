
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
%end

%hook BBPhoneMPOtherVideoGameCell
+(double)getHeightWithObject:(id)arg2 argv:(id)arg3 {
return 0;
}
%end

%hook BBPhoneMPOtherVideoAdCell
+(double)getHeightWithObject:(id)arg2 argv:(id)arg3 {
return 0;
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