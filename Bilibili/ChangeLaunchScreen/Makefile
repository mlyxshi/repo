ARCHS = arm64e
TARGET = iphone:latest:13
include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = ChangeLaunchScreen

ChangeLaunchScreen_FILES = main.m CLSAppDelegate.m CLSRootViewController.m
ChangeLaunchScreen_FRAMEWORKS = UIKit CoreGraphics
ChangeLaunchScreen_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/application.mk

after-install::
	install.exec "killall \"ChangeLaunchScreen\"" || true
