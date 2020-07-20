%hook SBFullscreenZoomView
- (void)addSubview:(UIView *)arg1{
    UIView *view=[UIView new];
    view.backgroundColor=UIColor.blackColor;
    view.frame=arg1.frame;
    %orig(view);
}
%end
