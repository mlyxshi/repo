#include <ifaddrs.h>
#include <net/if.h>
#include <string.h>

@interface PerfectNetworkSpeedInfo: NSObject
{
    UIWindow *networkSpeedWindow;
    UILabel *networkSpeedLabel;
}
- (id)init;
- (void)updateText;
// - (void)updateOrientation;
- (void)updateFrame:(int) arg1;
// - (void)updateTextColor:(UIColor *)color;

@end


@interface UIApplication ()
- (UIDeviceOrientation)_frontMostAppOrientation;
@end

