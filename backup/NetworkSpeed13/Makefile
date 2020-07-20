ARCHS = arm64e
TARGET = iphone:latest:13

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NetworkSpeed13
NetworkSpeed13_FILES = NetworkSpeed13.xm
NetworkSpeed13_CFLAGS += -fobjc-arc -Wno-logical-op-parentheses
NetworkSpeed13_LIBRARIES += sparkcolourpicker sparkapplist
NetworkSpeed13_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += Preferences
include $(THEOS_MAKE_PATH)/aggregate.mk

