ARCHS = arm64e
TARGET = iphone:latest:13
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SpringBoardExtra

SpringBoardExtra_FILES = CCArtwork.xm MusicBeQuiet.xm QuitAll.xm CleanSpringBoard.xm CompactMediaPlayer.xm
SpringBoardExtra_PRIVATE_FRAMEWORKS = MediaRemote
SpringBoardExtra_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += SpringBoardExtraPreference
include $(THEOS_MAKE_PATH)/aggregate.mk
