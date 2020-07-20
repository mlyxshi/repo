ARCHS = arm64 arm64e
TARGET = iphone:11.2:11.2

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SplashChangePrefs
SplashChangePrefs_FILES = iDHSplashChangeRootListController.m
SplashChangePrefs_INSTALL_PATH = /Library/PreferenceBundles
SplashChangePrefs_FRAMEWORKS = UIKit
SplashChangePrefs_PRIVATE_FRAMEWORKS = Preferences
SplashChangePrefs_LIBRARIES = imagepicker

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SplashChangePrefs.plist$(ECHO_END)
