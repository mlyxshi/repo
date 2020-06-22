#include "LCRootListController.h"
#include <spawn.h>

@interface LSApplicationProxy:NSObject
+(id)applicationProxyForIdentifier:(id)arg1;
@end

@implementation LCRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

void run_cmd(char *cmd)
{
	pid_t pid;
	char *argv[] = {"sh", "-c", cmd, NULL};
	int status;

	status = posix_spawn(&pid, "/bin/sh", NULL, NULL, argv, NULL);
	if (status == 0)
	{
		if (waitpid(pid, &status, 0) == -1)
		{
			perror("waitpid");
		}
	}
}

-(void)replaceLC{
    run_cmd("killall -9 SpringBoard");
}



@end
