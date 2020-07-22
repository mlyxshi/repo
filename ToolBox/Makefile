ARCHS = arm64e
TARGET = iphone:latest:13
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ToolBox


include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += ToolBoxSetting
SUBPROJECTS += StoreSwitcher
SUBPROJECTS += YouTube
SUBPROJECTS += ZhiHu
SUBPROJECTS += BiliBili
SUBPROJECTS += Twitter
SUBPROJECTS += Globalize

include $(THEOS_MAKE_PATH)/aggregate.mk
 