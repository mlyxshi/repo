ARCHS = arm64e
TARGET = iphone:latest:13

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BiliBili

BiliBili_FILES = Tweak.xm

BiliBili_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
