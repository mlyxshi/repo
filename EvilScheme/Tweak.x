@interface FBSOpenApplicationOptions : NSObject
@property (nonatomic,copy) NSDictionary * dictionary;
@end

@interface FBSystemServiceOpenApplicationRequest : NSObject
@property (nonatomic,copy) NSString * bundleIdentifier;
@property(copy, nonatomic) FBSOpenApplicationOptions *options;
@end


%hook FBSystemServiceOpenApplicationRequest

- (void)setOptions:(FBSOpenApplicationOptions *)option {
	NSLog(@"mlyx Origin urlscheme %@,%@",self.bundleIdentifier,option);

	NSString * bundleIdentifier=self.bundleIdentifier;
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	[dict addEntriesFromDictionary: option.dictionary];



    //alook网页浏览禁止跳转github app，iOS只能看看通知
	if([bundleIdentifier isEqualToString:@"com.github.stormbreaker.prod"]){	
		self.bundleIdentifier=@"com.ld.TakeBrowser";
		NSLog(@"mlyx NEW urlscheme %@,%@",self.bundleIdentifier,option);
	}



	%orig;
}

%end


/*


	//默认浏览器换alook
	if([bundleIdentifier isEqualToString:@"com.apple.mobilesafari"]){
		self.bundleIdentifier=@"com.ld.TakeBrowser";
		NSLog(@"mlyx NEW urlscheme %@,%@",self.bundleIdentifier,option);
	}
	
    //cydia to zebra. sileo本身会劫持cydia的urlscheme
	if([bundleIdentifier isEqualToString:@"org.coolstar.SileoStore"]){	
		//cydia://url/https://cydia.saurik.com/api/share#?source=https://mlyxshi.github.io/repo/
		NSString *string=dict[@"__PayloadURL"];

		NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@".*source=(.*)" options:NSRegularExpressionCaseInsensitive error:NULL];
			
		NSTextCheckingResult *match = [regex firstMatchInString:string options:0 range:NSMakeRange(0, [string length])];

		if (match) {
			NSRange group1 = [match rangeAtIndex:1];
			NSString* matchText = [string substringWithRange:group1];
			dict[@"__PayloadURL"] =[NSString stringWithFormat:@"%@%@",@"zbra://sources/add/", matchText];	
		    option.dictionary=dict;
			self.bundleIdentifier=@"xyz.willy.Zebra";
			NSLog(@"mlyx NEW urlscheme %@,%@",self.bundleIdentifier,option);
		}
	}
*/


