ARCHS = arm64e
TARGET = iphone:latest:13

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Globalize
Globalize_FILES = Tweak.xm
include $(THEOS_MAKE_PATH)/tweak.mk

include $(THEOS_MAKE_PATH)/aggregate.mk
