
@interface BluetoothManager : NSObject
+(BluetoothManager *)sharedInstance;
-(NSArray *)connectedDevices;
@end

@interface BluetoothDevice
-(bool)isAppleAudioDevice;
-(bool)magicPaired;
@end

bool airpodsConnected(){
	for(BluetoothDevice *device in [[%c(BluetoothManager) sharedInstance] connectedDevices]){
        
		if([device isAppleAudioDevice] && [device magicPaired]){
			return true;
		}
	}
	return false;
}



@interface SBMediaController : NSObject
@property (nonatomic, weak,readonly) id nowPlayingApplication;
+(id)sharedInstance;
@end

%hook BluetoothDevice
-(bool)magicPaired{
	NSLog(@"mlyx_magic %d",%orig);
	return %orig;
}

%end

%hook _UIStatusBarBluetoothItem
-(UIImageView *)imageView{
    //如果当前没media应用，就开启网易云私人FM
    if (airpodsConnected()&&![[%c(SBMediaController) sharedInstance] nowPlayingApplication]) { 
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"orpheuswidget://radio"] options:@{} completionHandler:nil];         
    }

    return %orig;
}
%end





