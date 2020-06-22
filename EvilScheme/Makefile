ARCHS = arm64e
TARGET = iphone:latest:13

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = EvilScheme

EvilScheme_FILES = Tweak.x
EvilScheme_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
