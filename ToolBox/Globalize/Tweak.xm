//More info：
//https://sspai.com/post/41905
//https://www.theiphonewiki.com/wiki/Model_Regions


#import <substrate.h>

typedef mach_port_t io_object_t;
typedef io_object_t io_registry_entry_t;
typedef UInt32 IOOptionBits;
typedef char io_name_t[128];

const uint32_t swbh[] = {1,0,0,0}; // only "valid"

//For CHINA
//retval = CFDataCreate(kCFAllocatorDefault, (const unsigned char *)"CH/A", 5);

//CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options);

static CFTypeRef (*orig_registryEntry)(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options);
CFTypeRef replaced_registryEntry(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options) {
	CFTypeRef retval = NULL;
	if (CFEqual(key, CFSTR("region-info"))) {
		retval = CFDataCreate(kCFAllocatorDefault, (const unsigned char *)"X/A", 4); // FIXME: use real /A /B part 
	} else if (CFEqual(key, CFSTR("software-behavior"))) {
		retval = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)&swbh ,16);
   	} else {
        retval = orig_registryEntry(entry, plane, key, allocator, options);
	}
	return retval;
}

__attribute__((constructor)) static void regioninit() {
	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/mlyx.toolboxsetting.plist"];
	bool isGlobalizeEnabled=[settings objectForKey:@"isGlobalizeEnabled"] ? [[settings objectForKey:@"isGlobalizeEnabled"] boolValue] : 1;
    if(isGlobalizeEnabled){
		void * IORegistryEntrySearchCFProperty=MSFindSymbol(MSGetImageByName("/System/Library/Frameworks/IOKit.framework/Versions/A/IOKit"), "_IORegistryEntrySearchCFProperty");
	    MSHookFunction((void *)IORegistryEntrySearchCFProperty, (void *)replaced_registryEntry, (void **)&orig_registryEntry);
	}

}
