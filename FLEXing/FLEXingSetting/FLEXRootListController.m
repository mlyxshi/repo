#include "FLEXRootListController.h"
#import "SparkAppListTableViewController.h"

@implementation FLEXRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)selectIncludeApps
{
    SparkAppListTableViewController* s = [[SparkAppListTableViewController alloc] initWithIdentifier:@"mlyx.flexingsetting" andKey:@"includedApps"];
    [self.navigationController pushViewController:s animated:YES];
    self.navigationItem.hidesBackButton = FALSE;
}


@end
