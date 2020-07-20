%hook SBFullscreenZoomView
- (void)addSubview:(UIView *)view{
    %orig;
    NSLog(@"mlyx_test %@",view);
}
%end
