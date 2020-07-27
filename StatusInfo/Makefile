export ARCHS = arm64e
export TARGET = iphone:latest:13
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk
SUBPROJECTS += BatteryInfo
SUBPROJECTS += SignaldBm
SUBPROJECTS += NetRamInfo
include $(THEOS_MAKE_PATH)/aggregate.mk
