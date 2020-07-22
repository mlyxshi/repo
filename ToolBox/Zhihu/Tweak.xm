%hook AVPaasClient 
-(id)init {
return nil;
}
%end


%ctor {
    NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/mlyx.toolboxsetting.plist"];
	bool isZhiHuEnabled=[settings objectForKey:@"isZhiHuEnabled"] ? [[settings objectForKey:@"isZhiHuEnabled"] boolValue] : 1;
    if(isZhiHuEnabled){
		%init;
	}
}