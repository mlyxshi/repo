#import "NSPRootListController.h"
#import "SparkAppListTableViewController.h"
#import "SparkColourPickerView.h"
#import "spawn.h"

@implementation NSPRootListController

- (instancetype)init
{
    self = [super init];

    if (self)
	{
        NSPAppearanceSettings *appearanceSettings = [[NSPAppearanceSettings alloc] init];
        self.hb_appearanceSettings = appearanceSettings;
        self.respringButton = [[UIBarButtonItem alloc] initWithTitle: @"Respring" style: UIBarButtonItemStylePlain target: self action: @selector(respring)];
        self.respringButton.tintColor = [UIColor blackColor];
        self.navigationItem.rightBarButtonItem = self.respringButton;

        self.navigationItem.titleView = [UIView new];
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont boldSystemFontOfSize: 17];
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.titleLabel.text = @"NetworkSpeed13";
		self.titleLabel.alpha = 0.0;
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.navigationItem.titleView addSubview: self.titleLabel];

        [NSLayoutConstraint activateConstraints:
		@[
            [self.titleLabel.topAnchor constraintEqualToAnchor: self.navigationItem.titleView.topAnchor],
            [self.titleLabel.leadingAnchor constraintEqualToAnchor: self.navigationItem.titleView.leadingAnchor],
            [self.titleLabel.trailingAnchor constraintEqualToAnchor: self.navigationItem.titleView.trailingAnchor],
            [self.titleLabel.bottomAnchor constraintEqualToAnchor: self.navigationItem.titleView.bottomAnchor],
        ]];
    }
    return self;
}

- (void)viewWillAppear: (BOOL)animated
{
    [super viewWillAppear: animated];

    CGRect frame = self.table.bounds;
    frame.origin.y = -frame.size.height;

    self.navigationController.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.00 green:0.58 blue:0.00 alpha:1.0];
    [self.navigationController.navigationController.navigationBar setShadowImage: [UIImage new]];
    self.navigationController.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidAppear: (BOOL)animated
{
    [super viewDidAppear: animated];
    [self.navigationController.navigationController.navigationBar setTitleTextAttributes: @{NSForegroundColorAttributeName : [UIColor blackColor]}];
}

- (void)viewWillDisappear: (BOOL)animated
{
    [super viewWillDisappear: animated];
    [self.navigationController.navigationController.navigationBar setTitleTextAttributes: @{NSForegroundColorAttributeName : [UIColor blackColor]}];
}

- (void)scrollViewDidScroll: (UIScrollView*)scrollView
{
    if (scrollView.contentOffset.y > [NSPRootHeaderView headerH] / 2.0) [UIView animateWithDuration: 0.2 animations: ^{ self.titleLabel.alpha = 1.0; }];
	else [UIView animateWithDuration:0.2 animations: ^{ self.titleLabel.alpha = 0.0; }];
}

- (NSArray*)specifiers
{
	if (!_specifiers) _specifiers = [self loadSpecifiersFromPlistName: @"Root" target: self];
	return _specifiers;
}

- (void)selectBlackListedApps
{
    SparkAppListTableViewController *s = [[SparkAppListTableViewController alloc] initWithIdentifier: @"com.johnzaro.networkspeed13prefs.blackListedApps" andKey: @"blackListedApps"];

    [self.navigationController pushViewController: s animated: YES];
    self.navigationItem.hidesBackButton = FALSE;
}

- (void)selectDoubleTapApp
{
    SparkAppListTableViewController *s = [[SparkAppListTableViewController alloc] initWithIdentifier: @"com.johnzaro.networkspeed13prefs.gestureApps" andKey: @"doubleTapApp"];
    [s setMaxEnabled: 1];

    [self.navigationController pushViewController: s animated: YES];
    self.navigationItem.hidesBackButton = FALSE;
}

- (void)selectHoldApp
{
    SparkAppListTableViewController *s = [[SparkAppListTableViewController alloc] initWithIdentifier: @"com.johnzaro.networkspeed13prefs.gestureApps" andKey: @"holdApp"];
    [s setMaxEnabled: 1];
    
    [self.navigationController pushViewController: s animated: YES];
    self.navigationItem.hidesBackButton = FALSE;
}

- (void)reset: (PSSpecifier*)specifier
{
    UIAlertController *reset = [UIAlertController
        alertControllerWithTitle: @"NetworkSpeed13"
		message: @"Do you really want to Reset All Settings?"
		preferredStyle: UIAlertControllerStyleAlert];
	UIAlertAction *confirmAction = [UIAlertAction actionWithTitle: @"Confirm" style: UIAlertActionStyleDestructive handler:
        ^(UIAlertAction * action)
        {
            [[[HBPreferences alloc] initWithIdentifier: @"com.johnzaro.networkspeed13prefs"] removeAllObjects];

            NSFileManager *manager = [NSFileManager defaultManager];
            [manager removeItemAtPath: @"/var/mobile/Library/Preferences/com.johnzaro.networkspeed13prefs.plist" error: nil];
            [manager removeItemAtPath: @"/var/mobile/Library/Preferences/com.johnzaro.networkspeed13prefs.colors.plist" error: nil];
            [manager removeItemAtPath: @"/var/mobile/Library/Preferences/com.johnzaro.networkspeed13prefs.gestureApps.plist" error: nil];
            [manager removeItemAtPath: @"/var/mobile/Library/Preferences/com.johnzaro.networkspeed13prefs.blackListedApps.plist" error: nil];

            [self respring];
        }];

	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle: @"Cancel" style: UIAlertActionStyleCancel handler: nil];
	[reset addAction: confirmAction];
	[reset addAction: cancelAction];
	[self presentViewController: reset animated: YES completion: nil];
}

- (void)respring
{
	pid_t pid;
	const char *args[] = {"sbreload", NULL, NULL, NULL};
	posix_spawn(&pid, "usr/bin/sbreload", NULL, NULL, (char *const *)args, NULL);
}

- (void)email
{
	if([%c(MFMailComposeViewController) canSendMail])
	{
		MFMailComposeViewController *mailCont = [[%c(MFMailComposeViewController) alloc] init];
		mailCont.mailComposeDelegate = self;

		[mailCont setToRecipients: [NSArray arrayWithObject: @"johnzrgnns@gmail.com"]];
		[self presentViewController: mailCont animated: YES completion: nil];
	}
}

- (void)reddit
{
	if([[UIApplication sharedApplication] canOpenURL: [NSURL URLWithString: @"reddit://"]])
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"reddit://www.reddit.com/user/johnzaro"]];
	else
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.reddit.com/user/johnzaro"]];
}

-(void)mailComposeController:(id)arg1 didFinishWithResult:(long long)arg2 error:(id)arg3
{
    [self dismissViewControllerAnimated: YES completion: nil];
}

@end
