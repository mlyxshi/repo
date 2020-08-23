%hook AnyNameYouLike

-(void)setLyricsPrompter:(void *)arg2 {
  %orig;
  NSLog(@"mlyx_lyric %@",arg2);
}
%end

%ctor {
%init(AnyNameYouLike = objc_getClass("LyricsX.LyricsPrompterView"););
}