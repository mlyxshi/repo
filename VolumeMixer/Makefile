export ARCHS = arm64e
export TARGET = iphone:latest:9

TWEAK_NAME = VolumeMixer

VolumeMixer_FILES = Tweak.xm VMHUDView.mm VMHUDWindow.mm VMHUDRootViewController.mm VMIPCCenter.mm  VMHookInfo.mm VMHookAudioUnit.mm
VolumeMixer_CFLAGS = -fobjc-arc -Wno-error=unused-variable -Wno-error=unused-function -Wno-error=unused-value -std=c++11 -include Prefix.pch
VolumeMixer_LIBRARIES = applist mryipc

SUBPROJECTS += VolumeMixerSetting

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

INSTALL_TARGET_PROCESSES = SpringBoard