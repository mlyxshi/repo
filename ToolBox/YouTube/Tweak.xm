%hook YTInfoCardTeaserViewController
-(void)loadView{
}
%end

%hook YTCreatorEndscreenView
- (id)initWithFrame:(CGRect)arg1 {
    return nil;
}
%end

%ctor {
    NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/mlyx.toolboxsetting.plist"];
	bool isYouTubeEnabled=[settings objectForKey:@"isYouTubeEnabled"] ? [[settings objectForKey:@"isYouTubeEnabled"] boolValue] : 1;
    if(isYouTubeEnabled){
		%init;
	}
}