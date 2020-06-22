ARCHS = arm64e
TARGET = iphone:latest:13
INSTALL_TARGET_PROCESSES = com.google.ios.youtube

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = youtube

youtube_FILES = Tweak.xm
youtube_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
