ARCHS = arm64e
TARGET = iphone:latest:13
INSTALL_TARGET_PROCESSES = Preferences


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PreferenceLoader

PreferenceLoader_FILES = Tweak.xm
PreferenceLoader_CFLAGS = -fobjc-arc
PreferenceLoader_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/tweak.mk
