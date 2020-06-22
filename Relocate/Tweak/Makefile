ARCHS = arm64e
TARGET = iphone:latest:11

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Relocate
$(TWEAK_NAME)_FILES = Tweak.xm RLCAnalogStickWindow.m
ADDITIONAL_OBJCFLAGS = -fobjc-arc
$(TWEAK_NAME)_FRAMEWORKS = CoreLocation QuartzCore
$(TWEAK_NAME)_EXTRA_FRAMEWORKS = Cephei

include $(THEOS_MAKE_PATH)/tweak.mk