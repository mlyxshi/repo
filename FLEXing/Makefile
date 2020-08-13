export ARCHS = arm64e arm64
export TARGET = iphone:latest:13
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FLEXing
FLEXing_FILES = Tweak.xm SpringBoard.xm
FLEXing_CFLAGS += -fobjc-arc -w
FLEXing_LIBRARIES += sparkapplist

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += FLEXingSetting
include $(THEOS_MAKE_PATH)/aggregate.mk
