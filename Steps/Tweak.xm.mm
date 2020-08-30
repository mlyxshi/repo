#line 1 "Tweak.xm"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "substrate.h"




#include <objc/message.h>
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

__attribute__((unused)) static void _logos_register_hook(Class _class, SEL _cmd, IMP _new, IMP *_old) {
unsigned int _count, _i;
Class _searchedClass = _class;
Method *_methods;
while (_searchedClass) {
_methods = class_copyMethodList(_searchedClass, &_count);
for (_i = 0; _i < _count; _i++) {
if (method_getName(_methods[_i]) == _cmd) {
if (_class == _searchedClass) {
*_old = method_getImplementation(_methods[_i]);
*_old = method_setImplementation(_methods[_i], _new);
} else {
class_addMethod(_class, _cmd, _new, method_getTypeEncoding(_methods[_i]));
}
free(_methods);
return;
}
}
free(_methods);
_searchedClass = class_getSuperclass(_searchedClass);
}
}
@class CAWindowServerDisplay; 
static Class _logos_superclass$_ungrouped$CAWindowServerDisplay; static unsigned (*_logos_orig$_ungrouped$CAWindowServerDisplay$contextIdAtPosition$excludingContextIds$)(_LOGOS_SELF_TYPE_NORMAL CAWindowServerDisplay* _LOGOS_SELF_CONST, SEL, CGPoint, id);

#line 7 "Tweak.xm"

static unsigned _logos_method$_ungrouped$CAWindowServerDisplay$contextIdAtPosition$excludingContextIds$(_LOGOS_SELF_TYPE_NORMAL CAWindowServerDisplay* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGPoint arg1, id arg2){ 
  NSLog(@"mlyx contextIdAtPosition:(CGPoint){%g, %g} excludingContextIds:(id)%@  return %d",arg1.x,arg1.y,arg2,(_logos_orig$_ungrouped$CAWindowServerDisplay$contextIdAtPosition$excludingContextIds$ ? _logos_orig$_ungrouped$CAWindowServerDisplay$contextIdAtPosition$excludingContextIds$ : (__typeof__(_logos_orig$_ungrouped$CAWindowServerDisplay$contextIdAtPosition$excludingContextIds$))class_getMethodImplementation(_logos_superclass$_ungrouped$CAWindowServerDisplay, @selector(contextIdAtPosition:excludingContextIds:)))(self, _cmd, arg1, arg2));
  return (_logos_orig$_ungrouped$CAWindowServerDisplay$contextIdAtPosition$excludingContextIds$ ? _logos_orig$_ungrouped$CAWindowServerDisplay$contextIdAtPosition$excludingContextIds$ : (__typeof__(_logos_orig$_ungrouped$CAWindowServerDisplay$contextIdAtPosition$excludingContextIds$))class_getMethodImplementation(_logos_superclass$_ungrouped$CAWindowServerDisplay, @selector(contextIdAtPosition:excludingContextIds:)))(self, _cmd, arg1, arg2);
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CAWindowServerDisplay = objc_getClass("CAWindowServerDisplay"); _logos_superclass$_ungrouped$CAWindowServerDisplay = class_getSuperclass(_logos_class$_ungrouped$CAWindowServerDisplay); { _logos_register_hook(_logos_class$_ungrouped$CAWindowServerDisplay, @selector(contextIdAtPosition:excludingContextIds:), (IMP)&_logos_method$_ungrouped$CAWindowServerDisplay$contextIdAtPosition$excludingContextIds$, (IMP *)&_logos_orig$_ungrouped$CAWindowServerDisplay$contextIdAtPosition$excludingContextIds$);}} }
#line 13 "Tweak.xm"
