#import "NetSpeed.h"
#import "RAM.h"

#define FONT_SIZE 9

static float  DEVICE_WIDTH;
static float  DEVICE_HEIGHT;

//portrait mode
static float  WINDOW_X_PORTRAIT = 313;
static float  WINDOW_Y_PORTRAIT = 0;
static float  WINDOW_W = 85;
static float  WINDOW_H = 16;

//landscapeLeft mode
static float  WINDOW_X_LANDSCAPELEFT;
static float  WINDOW_Y_LANDSCAPELEFT;




typedef struct
{
    uint32_t inputBytes;
    uint32_t outputBytes;
} UpDownBytes;

static long oldUpSpeed = 0, oldDownSpeed = 0;
static int updateInterval = 1;


static const long KILOBYTES = 1 << 10;
static const long MEGABYTES = 1 << 20;

NSString* formatSpeed(long bytes)
{

        if(bytes < KILOBYTES) return @"0KB/s";
        else if(bytes < MEGABYTES) return [NSString stringWithFormat:@"%.0fKB/s", (double)bytes / KILOBYTES];
        else return [NSString stringWithFormat:@"%.2fMB/s", (double)bytes / MEGABYTES];
}

UpDownBytes getUpDownBytes()
{
	struct ifaddrs *ifa_list = 0, *ifa;
	UpDownBytes upDownBytes;
	upDownBytes.inputBytes = 0;
	upDownBytes.outputBytes = 0;
	
	if((getifaddrs(&ifa_list) < 0) || !ifa_list || ifa_list == 0)
		return upDownBytes;

	for(ifa = ifa_list; ifa; ifa = ifa->ifa_next)
	{
		if(ifa->ifa_addr == NULL
		|| AF_LINK != ifa->ifa_addr->sa_family
		|| (!(ifa->ifa_flags & IFF_UP) && !(ifa->ifa_flags & IFF_RUNNING))
		|| ifa->ifa_data == NULL || ifa->ifa_data == 0
		|| strstr(ifa->ifa_name, "lo0")
		|| strstr(ifa->ifa_name, "utun"))
			continue;
		
		struct if_data *if_data = (struct if_data *)ifa->ifa_data;

		upDownBytes.inputBytes += if_data->ifi_ibytes;
		upDownBytes.outputBytes += if_data->ifi_obytes;
	}
	if(ifa_list)
		freeifaddrs(ifa_list);

	return upDownBytes;
}



static NSMutableString* formattedString()
{
	NSMutableString* mutableString = [NSMutableString new];
	
	UpDownBytes upDownBytes = getUpDownBytes();
	long upDiff = (upDownBytes.outputBytes - oldUpSpeed) / updateInterval;
	long downDiff = (upDownBytes.inputBytes - oldDownSpeed) / updateInterval;
	oldUpSpeed = upDownBytes.outputBytes;
	oldDownSpeed = upDownBytes.inputBytes;




	if(upDiff > 50 * MEGABYTES && downDiff > 50 * MEGABYTES)
	{
		upDiff = 0;
		downDiff = 0;
	}


 	[mutableString appendString: [NSString stringWithFormat: @"%@%@", @"↓", formatSpeed(downDiff)]];
	
	[mutableString appendString: @" "];
		
	[mutableString appendString: [NSString stringWithFormat: @"%@%@", @"↑", formatSpeed(upDiff)]];
			
			
	return [mutableString copy];
}

static NSString* getMemoryStats()
{
	mach_port_t host_port;
	mach_msg_type_number_t host_size;
	vm_size_t pagesize;
	vm_statistics_data_t vm_stat;
	natural_t mem_used, mem_free;
	NSMutableString* mutableString = [[NSMutableString alloc] init];

	host_port = mach_host_self();
	host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
	host_page_size(host_port, &pagesize);
	if(host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) == KERN_SUCCESS)
	{

		mem_used = (vm_stat.active_count + vm_stat.inactive_count + vm_stat.wire_count) * pagesize / MEGABYTES;
		[mutableString appendString: [NSString stringWithFormat:@"%@%uMB", @"U:", mem_used]];
	     
		[mutableString appendString: @" "];
		mem_free = vm_stat.free_count * pagesize / MEGABYTES;
		[mutableString appendString: [NSString stringWithFormat:@"%@%uMB", @"F:", mem_free]];
		
	}
	return [mutableString copy];
}

@implementation PerfectNetworkSpeedInfo
- (id)init{
   self = [super init];
   if(self){

    networkSpeedWindow = [[UIWindow alloc] initWithFrame:CGRectMake(WINDOW_X_PORTRAIT,WINDOW_Y_PORTRAIT,WINDOW_W,WINDOW_H)];
    networkSpeedLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,networkSpeedWindow.frame.size.width,networkSpeedWindow.frame.size.height)];
   
  
    [networkSpeedLabel setAdjustsFontSizeToFitWidth: YES];
    [networkSpeedLabel setFont:[UIFont boldSystemFontOfSize:FONT_SIZE]];
    [networkSpeedLabel setTextAlignment:NSTextAlignmentCenter];
    [networkSpeedLabel setBackgroundColor:[[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0.233]];


	[networkSpeedWindow addSubview:networkSpeedLabel];
  
    [networkSpeedWindow setWindowLevel:2000];
    [networkSpeedWindow setHidden:0];
	//Debug
	//networkSpeedWindow.backgroundColor = [UIColor blueColor];
     
	[NSTimer scheduledTimerWithTimeInterval: updateInterval target: self selector: @selector(updateText) userInfo: nil repeats: YES];
    
   }
   return self;
}

- (void)updateText{
	networkSpeedLabel.text=formattedString();
}

- (void)updateFrame:(int)orientation{


    WINDOW_X_LANDSCAPELEFT = WINDOW_X_PORTRAIT;
    WINDOW_Y_LANDSCAPELEFT = DEVICE_HEIGHT-WINDOW_W;

	if(orientation==1){
		//portrait:  held upright and the home button at the bottom.
		networkSpeedWindow.transform = CGAffineTransformMakeRotation(0);
		networkSpeedWindow.frame=CGRectMake(WINDOW_X_PORTRAIT,WINDOW_Y_PORTRAIT,WINDOW_W,WINDOW_H);
	}
	if(orientation==3){
		//landscapeLeft: held upright and the home button on the right side.
		networkSpeedWindow.transform = CGAffineTransformMakeRotation(M_PI_2);
		networkSpeedWindow.frame=CGRectMake(WINDOW_X_LANDSCAPELEFT,WINDOW_Y_LANDSCAPELEFT,WINDOW_W,WINDOW_H);

	}

}


@end

@implementation PerfectRAMInfo
- (id)init{
   self = [super init];
   if(self){

    RAMWindow = [[UIWindow alloc] initWithFrame:CGRectMake(17,WINDOW_Y_PORTRAIT,WINDOW_W,WINDOW_H)];
    RAMLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,RAMWindow.frame.size.width,RAMWindow.frame.size.height)];
   
  
    [RAMLabel setAdjustsFontSizeToFitWidth: YES];
    [RAMLabel setFont:[UIFont boldSystemFontOfSize:FONT_SIZE]];
    [RAMLabel setTextAlignment:NSTextAlignmentCenter];
    [RAMLabel setBackgroundColor:[[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0.233]];


	[RAMWindow addSubview:RAMLabel];
  
    [RAMWindow setWindowLevel:2000];
    [RAMWindow setHidden:0];
	//Debug
	//RAMWindow.backgroundColor = [UIColor blueColor];
     
	[NSTimer scheduledTimerWithTimeInterval: updateInterval target: self selector: @selector(updateText) userInfo: nil repeats: YES];
    
   }
   return self;
}

- (void)updateText{
	RAMLabel.text=getMemoryStats();
}

- (void)setHidden:(int) arg1{
	RAMWindow.hidden=arg1;

}
@end








//-------SpringBoard-------



static PerfectNetworkSpeedInfo* networkSpeedObject;
static PerfectRAMInfo* RAMObject;

static void orientationChanged(){
	UIDeviceOrientation orientation = [[UIApplication sharedApplication] _frontMostAppOrientation];
	NSLog(@"mlyx orientation %ld",orientation);

	//NetWindow
	[networkSpeedObject updateFrame:orientation];
	
	//RAmWindow
	if(orientation==1){
		[RAMObject setHidden:0];
	}

	if(orientation==3){
		[RAMObject setHidden:1];
	}
}

%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)arg1 {
    %orig; 

    //当屏幕旋转后会变化
	DEVICE_WIDTH = [[UIScreen mainScreen] bounds].size.width;   //xs max 414
    DEVICE_HEIGHT = [[UIScreen mainScreen] bounds].size.height; //xs max 896

    if(!networkSpeedObject){
		networkSpeedObject =  [PerfectNetworkSpeedInfo new];
    }

	if(!RAMObject){
		RAMObject =  [PerfectRAMInfo new];
    }
    
	//监测rotate
	CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, (CFNotificationCallback)orientationChanged, CFSTR("UIWindowDidRotateNotification"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}


%end

