ARCHS = arm64
TARGET = iphone:latest:13
INSTALL_TARGET_PROCESSES = Preferences


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PreferenceX
PreferenceX_FILES = Tweak.xm
PreferenceX_CFLAGS = -fobjc-arc
PreferenceX_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/tweak.mk
