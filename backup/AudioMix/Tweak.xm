#import <AVFoundation/AVFoundation.h>

NSString* bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier]; 

%hook AVAudioSession
- (BOOL)setActive:(BOOL)active withOptions:(AVAudioSessionSetActiveOptions)options error:(NSError **)outError{
  NSLog(@"mlyx AVAudio category %@, options %lu",[self category],options);

  if([bundleIdentifier isEqualToString:@"com.netease.cloudmusic"]||[bundleIdentifier isEqualToString:@"com.tencent.QQMusic"]){
    [self setCategory:AVAudioSessionCategoryPlayback withOptions:0 error:outError];
  }else{
    [self setCategory:[self category] withOptions:2 error:outError];
  }
  
	return %orig;
}
%end


/*
0. default
default下media remote 才能正常运作，给网易云和QQ音乐这2个最重要的使用

1. AVAudioSessionCategoryOptionMixWithOthers   
An option that indicates whether audio from this session mixes with audio from active sessions in other audio apps.

2. AVAudioSessionCategoryOptionDuckOthers
An option that reduces the volume of other audio session while audio from this session plays.
*/