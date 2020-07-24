@interface QMRootTabBarItem:UIView
@property(copy, nonatomic) NSString *title;
@end

@interface QMRecommendWordRollView:UIView
@end

//TAB
%hook QMRootTabBarItem
- (void)layoutSubviews{
  %orig;

  if([self.title isEqualToString:@"首页"]||[self.title isEqualToString:@"我的"])
    return;

  [self removeFromSuperview];  
}
%end

//splash
%hook FlashScreenManager
-(id)init{
  return nil;
}
%end

//search placeholder
%hook QMRecommendWordRollView
-(id)init{
  return nil;
}
%end

//hot search
%hook OnLineSearchViewController
-(void)setHotWordView:(id)arg1{
}
%end


//我的 广告
%hook QMMyMusicAdBannerCell
+ (double)cellHeight{
  return 0;
}
%end


//歌单 底部
%hook QMPROmgAdBannerView
- (id)initWithFrame:(struct CGRect)arg1{
  return nil;
}
%end



