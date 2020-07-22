%hook YTInfoCardTeaserViewController
-(void)loadView{
}
%end

%ctor {
    NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/mlyx.toolboxsetting.plist"];
	bool isYouTubeEnabled=[settings objectForKey:@"isYouTubeEnabled"] ? [[settings objectForKey:@"isYouTubeEnabled"] boolValue] : 1;
    if(isYouTubeEnabled){
		%init;
	}
}

/*
%hook YTCreatorEndscreenView
- (id)initWithFrame: (CGRect)arg1{
	return 0;
}
%end

@interface YTAsyncCollectionView:UICollectionView
@end

%hook YTAsyncCollectionView
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  NSLog(@"mlyx_debug %@",indexPath);
  UICollectionViewCell * cell=%orig;
  //cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
  if([cell isKindOfClass: %c(YTPromotedVideoInlineMutedCell)]||[cell isKindOfClass: %c(YTHorizontalCardListCell)]||[cell isKindOfClass: %c(YTReelShelfCell)]){
	cell.hidden=1;
  }
  return cell;
}
%hook YTAsyncCollectionView
- (void)layoutSubviews{
   %orig;
	for(UIView *subview in [self subviews]){
      	if([subview isKindOfClass: %c(YTPromotedVideoInlineMutedCell)]){
		  	subview.hidden=1;
        }
    }
}
%end

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath { 
	UICollectionViewCell *cell = [self cellForItemAtIndexPath: indexPath]; 
	if([cell isKindOfClass: %c(YTPromotedVideoInlineMutedCell)]||[cell isKindOfClass: %c(YTHorizontalCardListCell)]||[cell isKindOfClass: %c(YTReelShelfCell)]){
	   cell.hidden=1;
	}
	return %orig;
}

*/
