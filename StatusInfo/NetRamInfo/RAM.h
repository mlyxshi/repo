#import <mach/mach_init.h>
#import <mach/mach_host.h>

@interface PerfectRAMInfo: NSObject
{
    UIWindow *RAMWindow;
    UILabel *RAMLabel;
}
- (id)init;
- (void)updateText;
- (void)setHidden:(int) arg1;
@end

