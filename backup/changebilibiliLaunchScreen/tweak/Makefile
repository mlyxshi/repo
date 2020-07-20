ARCHS = arm64e
TARGET = iphone:latest:13
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Tweak

Tweak_FILES = Tweak.x LaunchScreenDetailViewController.m LaunchScreenModel.m
Tweak_CFLAGS = -fobjc-arc -Wno-error=unused-variable -Wno-error=unused-function

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Tweak" ||true
