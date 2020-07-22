ARCHS = arm64e
TARGET = iphone:latest:12

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Selector
$(TWEAK_NAME)_FILES = SLCWindow.m Tweak.xm
ADDITIONAL_OBJCFLAGS = -fobjc-arc
$(TWEAK_NAME)_FRAMEWORKS += UIKit QuartzCore WebKit
include $(THEOS_MAKE_PATH)/tweak.mk