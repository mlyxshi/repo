ARCHS = arm64e
TARGET = iphone:latest:13
INSTALL_TARGET_PROCESSES = tv.danmaku.bilianime

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BiliBili

BiliBili_FILES = Tweak.xm

BiliBili_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
# SUBPROJECTS += ChangeLaunchScreen
include $(THEOS_MAKE_PATH)/aggregate.mk
