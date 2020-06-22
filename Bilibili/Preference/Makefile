ARCHS = arm64e
TARGET = iphone:latest:13

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = LaunchScreen

LaunchScreen_FILES = LCRootListController.m
LaunchScreen_INSTALL_PATH = /Library/PreferenceBundles
LaunchScreen_FRAMEWORKS = UIKit
LaunchScreen_PRIVATE_FRAMEWORKS = Preferences
LaunchScreen_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/LaunchScreen.plist$(ECHO_END)
