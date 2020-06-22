#import "BDInfoListController.h"
#import <Preferences/PSSpecifier.h>

@implementation BDInfoListController
-(void)loadView{
	[super loadView];
    self.navigationItem.title = @"作者";
    
}
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [NSMutableArray arrayWithCapacity:5];

        PSSpecifier* spec;
        spec = [PSSpecifier preferenceSpecifierNamed:@""
                                              target:self
                                              set:Nil
                                              get:Nil
                                              detail:Nil
                                              cell:PSGroupCell
                                              edit:Nil];
        [spec setProperty:@"" forKey:@"label"];
        [_specifiers addObject:spec];
        
        spec = [PSSpecifier preferenceSpecifierNamed:@"Github"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
        spec->action = @selector(open_github);
        [spec setProperty:@YES forKey:@"hasIcon"];
        [spec setProperty:[UIImage imageNamed:@"github" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forKey:@"iconImage"];
        [_specifiers addObject:spec];

        spec = [PSSpecifier preferenceSpecifierNamed:@"Bilibili"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
        spec->action = @selector(open_bilibili);
        [spec setProperty:@YES forKey:@"hasIcon"];
        [spec setProperty:[UIImage imageNamed:@"bilibili" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forKey:@"iconImage"];
        [_specifiers addObject:spec];
        spec = [PSSpecifier preferenceSpecifierNamed:@"打赏支持"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
        spec->action = @selector(open_alipay);
        [spec setProperty:@YES forKey:@"hasIcon"];
        [spec setProperty:[UIImage imageNamed:@"alipay" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forKey:@"iconImage"];
        [_specifiers addObject:spec];
        

        spec = [PSSpecifier preferenceSpecifierNamed:@"添加我的软件源"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
        spec->action = @selector(open_cydia);
        [spec setProperty:@YES forKey:@"hasIcon"];
        [spec setProperty:[UIImage imageNamed:@"cydia" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forKey:@"iconImage"];
        [_specifiers addObject:spec];

        spec = [PSSpecifier preferenceSpecifierNamed:@""
                                              target:self
                                              set:Nil
                                              get:Nil
                                              detail:Nil
                                              cell:PSGroupCell
                                              edit:Nil];
        [spec setProperty:@"" forKey:@"label"];
        [_specifiers addObject:spec];

        spec = [PSSpecifier preferenceSpecifierNamed:@"Follow Me"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
        spec->action = @selector(open_twitter);
        [spec setProperty:@YES forKey:@"hasIcon"];
        [spec setProperty:[UIImage imageNamed:@"twitter" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forKey:@"iconImage"];
        [_specifiers addObject:spec];

        spec = [PSSpecifier preferenceSpecifierNamed:@"Support Developer"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
        spec->action = @selector(open_paypal);
        [spec setProperty:@YES forKey:@"hasIcon"];
        [spec setProperty:[UIImage imageNamed:@"paypal" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forKey:@"iconImage"];
        [_specifiers addObject:spec];

	}

	return _specifiers;
}

- (void)open_bilibili{
    UIApplication *app = [UIApplication sharedApplication];
    [app openURL:[NSURL URLWithString:@"https://space.bilibili.com/22182611"] options:@{} completionHandler:nil];
}
- (void)open_github{
  UIApplication *app = [UIApplication sharedApplication];
  [app openURL:[NSURL URLWithString:@"https://github.com/brendonjkding"] options:@{} completionHandler:nil];
}
- (void)open_alipay{
  UIApplication *app = [UIApplication sharedApplication];
  [app openURL:[NSURL URLWithString:@"https://qr.alipay.com/fkx199226yyspdubbiibddc"] options:@{} completionHandler:nil];
}
- (void)open_paypal{
  UIApplication *app = [UIApplication sharedApplication];
  [app openURL:[NSURL URLWithString:@"https://paypal.me/brend0n"] options:@{} completionHandler:nil];
}
- (void)open_cydia{
  UIApplication *app = [UIApplication sharedApplication];
  [app openURL:[NSURL URLWithString:@"cydia://url/https://cydia.saurik.com/api/share#?source=http://brendonjkding.github.io"] options:@{} completionHandler:nil];
}
- (void)open_twitter{
  UIApplication *app = [UIApplication sharedApplication];
	[app openURL:[NSURL URLWithString:@"https://mobile.twitter.com/brendonjkding"] options:@{} completionHandler:nil];

}

@end