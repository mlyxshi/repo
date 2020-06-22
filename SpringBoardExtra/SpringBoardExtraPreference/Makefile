ARCHS = arm64e
TARGET = iphone:latest:13
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SpringBoardExtraPreference

SpringBoardExtraPreference_FILES = SBERootListController.m
SpringBoardExtraPreference_INSTALL_PATH = /Library/PreferenceBundles
SpringBoardExtraPreference_FRAMEWORKS = UIKit
SpringBoardExtraPreference_PRIVATE_FRAMEWORKS = Preferences
SpringBoardExtraPreference_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SpringBoardExtraPreference.plist$(ECHO_END)
