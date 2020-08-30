#line 1 "Tweak.xm"

#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class CAWindowServerDisplay; 
static unsigned (*_logos_orig$_ungrouped$CAWindowServerDisplay$contextIdAtPosition$excludingContextIds$)(_LOGOS_SELF_TYPE_NORMAL CAWindowServerDisplay* _LOGOS_SELF_CONST, SEL, CGPoint, id); static unsigned _logos_method$_ungrouped$CAWindowServerDisplay$contextIdAtPosition$excludingContextIds$(_LOGOS_SELF_TYPE_NORMAL CAWindowServerDisplay* _LOGOS_SELF_CONST, SEL, CGPoint, id); 

#line 1 "Tweak.xm"

static unsigned _logos_method$_ungrouped$CAWindowServerDisplay$contextIdAtPosition$excludingContextIds$(_LOGOS_SELF_TYPE_NORMAL CAWindowServerDisplay* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGPoint arg1, id arg2){ 
  NSLog(@"mlyx contextIdAtPosition:(CGPoint){%g, %g} excludingContextIds:(id)%@  return %d",arg1.x,arg1.y,arg2,_logos_orig$_ungrouped$CAWindowServerDisplay$contextIdAtPosition$excludingContextIds$(self, _cmd, arg1, arg2));
  return _logos_orig$_ungrouped$CAWindowServerDisplay$contextIdAtPosition$excludingContextIds$(self, _cmd, arg1, arg2);
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CAWindowServerDisplay = objc_getClass("CAWindowServerDisplay"); { MSHookMessageEx(_logos_class$_ungrouped$CAWindowServerDisplay, @selector(contextIdAtPosition:excludingContextIds:), (IMP)&_logos_method$_ungrouped$CAWindowServerDisplay$contextIdAtPosition$excludingContextIds$, (IMP*)&_logos_orig$_ungrouped$CAWindowServerDisplay$contextIdAtPosition$excludingContextIds$);}} }
#line 7 "Tweak.xm"
