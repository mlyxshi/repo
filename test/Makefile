ARCHS = arm64e
TARGET = iphone:latest:13

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = test

test_FILES = Tweak.xm
test_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
