
@interface TFSTwitterEntityURL
@property  NSString* expandedURL;
- (NSString*)url;
@end

@interface TFNItemsDataViewController : NSObject
- (id)itemAtIndexPath:(id)arg1;
@end

%hook TFNItemsDataViewController
- (id)tableViewCellForItem:(id)arg1 atIndexPath:(id)arg2 {
  UITableViewCell *tbvCell = %orig;
  id item = [self itemAtIndexPath: arg2];
  if ([item respondsToSelector: @selector(isPromoted)] && [item performSelector:@selector(isPromoted)]) {
    [tbvCell setHidden: YES];
  }
  return tbvCell;  
}

- (double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2 {
  id item = [self itemAtIndexPath: arg2];
  if ([item respondsToSelector: @selector(isPromoted)] && [item performSelector:@selector(isPromoted)]) {
    return 0;
  }
  return %orig;
}
%end



%hook TFSTwitterEntityURL
  - (NSString*)url{
    return self.expandedURL;
  }
%end


%ctor {
  NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/mlyx.toolboxsetting.plist"];
	bool isTwitterEnabled=[settings objectForKey:@"isTwitterEnabled"] ? [[settings objectForKey:@"isTwitterEnabled"] boolValue] : 1;
  if(isTwitterEnabled){
		%init;
	}
}


/*

// @interface TFNTwitterStatus
// @property(readonly, nonatomic) NSString *sourceWithoutHTMLTags;
// @property(readonly, nonatomic) _Bool isPromoted;
// @property(readonly, nonatomic) NSString *advertiserName;
// @end

// @interface T1StatusCell
// @property  id playerSessionSource;
// @end

initWithCanonicalStatus:fromUser:retweetedStatus:quotedStatus:
initWithCanonicalStatus:fromUser:hasValidCanonicalStatus:
initWithCanonicalStatus:fromUser:hasValidCanonicalStatus:

%hook TFNTwitterStatus

- (id)initWithCanonicalStatus:(id)arg1 fromUser:(id)arg2 retweetedStatus:(id)arg3 quotedStatus:(id)arg4
{

//NSLog(@"mlyx %@, %@ ",%orig.sourceWithoutHTMLTags,%orig);

if([%orig.sourceWithoutHTMLTags isEqualToString:@"Twitter for Advertisers"]||[%orig.sourceWithoutHTMLTags isEqualToString:@"Twitter Ads"]){
return nil;
}

return %orig;
}
%end
*/



// %hook T1HomeTimelineItemsViewController
// - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//   UITableViewCell *cell = %orig;
//   if ([cell class]==%c(T1StatusCell)){
//       T1StatusCell *t1cell=(T1StatusCell*)cell;
//       TFNTwitterStatus *source =t1cell.playerSessionSource;
//       if(source.isPromoted){
//         NSLog(@"mlyx AD");
//         cell.hidden=1;
//       }
//   }
//   return cell;
// }

// - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//   UITableViewCell *cell = [tableView cellForRowAtIndexPath: indexPath];
//   if ([cell class]==%c(T1StatusCell)){
//       T1StatusCell *t1cell=(T1StatusCell*)cell;
//       TFNTwitterStatus *source =t1cell.playerSessionSource;
//       if(source.isPromoted){
//         NSLog(@"mlyx AD");
//         return 0;
//       }
//   }

//   return %orig;
// }

// %end
