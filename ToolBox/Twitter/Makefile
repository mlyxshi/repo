ARCHS = arm64e
TARGET = iphone:latest:13

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Twitter

Twitter_FILES = Tweak.xm
Twitter_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
