export ARCHS = arm64e
export TARGET = iphone:latest:13
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SSLPinning

SSLPinning_FILES = Tweak.x
SSLPinning_CFLAGS = -fobjc-arc
SSLPinning_LIBRARIES +=sparkapplist
include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += SSLPinningSetting
include $(THEOS_MAKE_PATH)/aggregate.mk
