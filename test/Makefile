ARCHS = arm64e
TARGET = iphone:latest:13
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = test

test_FILES = Tweak.xm
test_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
