#include "iDHSplashChangeRootListController.h"

@implementation iDHSplashChangeRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

-(void)loadView{
    [super loadView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveTapped)];
    [UIBarButtonItem release]; 
}

-(void)saveTapped {
    UIAlertController* MSAlertSaveView = [UIAlertController alertControllerWithTitle:@"SplashChange"
                            message:@"This will respring your device. Would you like to continue?"
                            preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Save!" style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction * action) {[self saveSettings];}];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                            handler:^(UIAlertAction * action) {}];
    
    [MSAlertSaveView addAction:defaultAction];
    [MSAlertSaveView addAction:cancelAction];
	[cancelAction setValue:[UIColor redColor] forKey:@"titleTextColor"];
    [self presentViewController:MSAlertSaveView animated:YES completion:nil];
}

-(void)saveSettings {
	CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.idevicehacked.splashchangeprefs/respring"), NULL, NULL, YES);
}

@end