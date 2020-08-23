export ARCHS = arm64
export TARGET = iphone:latest:13

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TEST

$(TWEAK_NAME)_FILES = Tweak.xm
# $(TWEAK_NAME)_PRIVATE_FRAMEWORKS = Preferences
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
