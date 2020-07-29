ARCHS = arm64e
TARGET = iphone:latest:13

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = PreferenceTest

PreferenceTest_FILES = PTRootListController.m
PreferenceTest_FRAMEWORKS = UIKit
PreferenceTest_PRIVATE_FRAMEWORKS = Preferences
PreferenceTest_INSTALL_PATH = /Library/PreferenceBundles
PreferenceTest_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
