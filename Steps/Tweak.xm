#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "substrate.h"

%config(generator=internal)

%hook CAWindowServerDisplay
-(unsigned)contextIdAtPosition:(CGPoint)arg1 excludingContextIds:(id)arg2{ 
  NSLog(@"mlyx contextIdAtPosition:(CGPoint){%g, %g} excludingContextIds:(id)%@  return %d",arg1.x,arg1.y,arg2,%orig);
  return %orig;
}
%end
