ARCHS = arm64 arm64e
TARGET = iphone:11.2:11.2

PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SplashChange
SplashChange_FILES = Tweak.xm
SplashChange_CFLAGS = -fobjc-arc
SplashChange_LIBRARIES = imagepicker

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += splashchangeprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
