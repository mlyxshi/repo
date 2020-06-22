
%hook BFCLaunchSplashViewController
//去除开屏广告window
- (void)buildUI{
}
%end

%hook BFCRestrictedModeTeenagersAlertView
//青少年
-(id)init{
  return nil;
}
%end


// 屏蔽track
%hook BFCNeuron
-(id)init{
return nil;
}
%end

%hook KFCMonitor
-(void)run{
}
%end


%hook BFCReportBaseV2 
-(void)sendReport {
}
%end



/*

  * frame #0: 0x00000001977db28c UIKitCore`-[UIWindow setRootViewController:]
    frame #1: 0x0000000103936254 bili-universal`-[BFCLauncherModule showSplashInHot:] + 776
    frame #2: 0x0000000103935234 bili-universal`-[BFCLauncherModule onApplicationLaunch:] + 1216
    frame #3: 0x00000001051efde0 bili-universal`-[BFCApplicationDelegate _onAppEvent:event:level:] + 144
    frame #4: 0x00000001051ef21c bili-universal`___lldb_unnamed_symbol82899$$bili-universal + 80
    frame #5: 0x00000001051ededc bili-universal`-[BFCApplicationDelegate runForEachModule:inLevel:] + 352
    frame #6: 0x00000001051eed98 bili-universal`-[BFCApplicationDelegate launchingModulesWithApplication:options:] + 496
    frame #7: 0x000000010150ce30 bili-universal`___lldb_unnamed_symbol44420$$bili-universal + 48
    frame #8: 0x0000000103958870 bili-universal`+[BFCUserAgreement setupWitApplicationDelegate:consentUserAgreementHandle:] + 128
    frame #9: 0x000000010150cdc8 bili-universal`-[BiliAppDelegate launchingModulesWithApplication:options:] + 168
    frame #10: 0x00000001051eeb80 bili-universal`-[BFCApplicationDelegate application:didFinishLaunchingWithOptions:] + 324
    frame #11: 0x0000000197797988 UIKitCore`-[UIApplication _handleDelegateCallbacksWithOptions:isSuspended:restoreState:] + 360
    frame #12: 0x0000000197799768 UIKitCore`-[UIApplication _callInitializationDelegatesWithActions:forCanvas:payload:fromOriginatingProcess:] + 5104
    frame #13: 0x000000019779f164 UIKitCore`-[UIApplication _runWithMainScene:transitionContext:completion:] + 1256

frame #2: 0x0000000103935234 bili-universal`-[BFCLauncherModule onApplicationLaunch:] + 1216
frame #1: 0x0000000103936254 bili-universal`-[BFCLauncherModule showSplashInHot:] + 776


create UIwindow  
广告
-[UIWindow setRootViewController:]  BFCLaunchSplashViewController
BFCLaunchSplashViewController init
BFCSplashManager splashAppealldbr
  r0 = [BFCSplashManager shared];







/*Feed 流广告之类 直接用Surge修改了，水平暂时不够
 #include <mach-o/dyld.h>
@interface BBPhoneAnimateBarItem:UIView
@property(retain, nonatomic) NSDictionary *itemData; 
@end

@interface BBPhoneTabDisplayManager
@property(retain, nonatomic) id result; 
+ (id)shared;
- (void)update;
@end

@interface BFCCommentNoticeModel
@property(retain, nonatomic) NSString *title; // @synthesize title=_title;
@end

@interface BFCCommentListModel
@property(retain, nonatomic) NSArray *hotList; // @synthesize hotList=_hotList;
@property(retain, nonatomic) NSArray *list; // @synthesize list=_list;
@property(retain, nonatomic) BFCCommentNoticeModel *notice; // @synthesize notice=_notice;
@end

@interface BFCApiOptions
@property(retain, nonatomic) NSDictionary *params; // @synthesize params=_params;
@end

%hook BBPhonePegasusCardBaseModel
//首页推荐Ad
- (_Bool)modelCustomTransformFromDictionary:(id)arg1{
//NSLog(@"mlyx %d",%orig);
//NSLog(@"mlyx %@",arg1);
//NSLog(@"mlyx is ad %@",[arg1 objectForKey:@"ad_info"]);
return [arg1 objectForKey:@"ad_info"]?0:1;
}
%end

%hook BBPhoneAnimateBarItem

- (void)layoutSubviews{
//右上角只保留消息
   %orig;
   self.hidden=[[self.itemData objectForKey:@"name"] isEqual:@"消息"]?0:1;
}
%end

%hook BBPhonePegasusBannerV5Cell
//首页推荐Banner
+ (double)getHeightWithObject:(id)arg1 argv:(id)arg2{
return 0;
}
%end


%hook BFCSplashManager
//Splash
+ (void)fetchSplash{
}
%end

%hook BFCApiRequest
- (id)initWithOptions:(BFCApiOptions* )arg1{
//NSLog(@"mlyx %@",arg1.params);
//NSLog(@"mlyx %@",%orig);
return %orig;
}

%end




//0x0000000000344000  base
//0x0000000104cb55b4  sethandle
//0x0000000104cb55b4  realhandle
//feed:  4345709672  0x103064468
//coment  4370032528  0x104796790


%hook BFCApiRequest
-(void)setCompletionHandler:(void (^)(id))arg2 {
  

  //dyld偏移
  NSLog(@"mlyx slide %ld",_dyld_get_image_vmaddr_slide(0));

 //获取arg2 block 地址
  NSString* originblock_hexstr_address= [NSString stringWithFormat:@"%p", arg2];
 //Hex string to long
  long originblock_long_address = strtoul([originblock_hexstr_address UTF8String],0,16);

  NSLog(@"mlyx originblock_long_address %ld",originblock_long_address);
     
  if(originblock_long_address!=0){

  //block invode的 在Hopper里具体实现的地址
    long origininvoke_long_address=*(long *)(16+originblock_long_address)-_dyld_get_image_vmaddr_slide(0);
    NSLog(@"mlyx origininvoke_long_address %ld",origininvoke_long_address);
    
    if(origininvoke_long_address==4345709672){

      void(^hookblock)(NSDictionary *)=^void(NSDictionary *dic){
      NSLog(@"mlyx FEED hook block dic arg%@",dic);
      arg2(dic);
      };


      %orig(hookblock);
  
    }else if(origininvoke_long_address==4370032528){

      void(^hookblock)(BFCCommentListModel *)=^void(BFCCommentListModel *dic){
      NSLog(@"mlyx COMMENT hook block dic arg%@",dic);
      arg2(dic);
      };


      %orig(hookblock);

   
    }else{
     %orig;
    }

  }else{
  %orig;
  }

}


%end

%hook BFCCommentListApi
+ (void)loadCommentListWith:(void *)arg2 completionHandler:(void (^)(BFCCommentListModel *model))arg3 errorHandler:(void *)arg4 {

NSLog(@"mlyx %@",arg2);
NSLog(@"mlyx %@",arg3);

 //获取arg2 block 地址
  NSString* originblock_hexstr_address= [NSString stringWithFormat:@"%p", arg3];
 //Hex string to long
  long originblock_long_address = strtoul([originblock_hexstr_address UTF8String],0,16);

 // NSLog(@"mlyx originblock_long_address %ld",originblock_long_address);
     
  if(originblock_long_address!=0){

  //block invode的 具体实现的地址
    long origininvoke_long_address=*(long *)(16+originblock_long_address)-_dyld_get_image_vmaddr_slide(0);
    NSLog(@"mlyx Other COMMENT origininvoke_long_address %ld",origininvoke_long_address);
  }


void(^hookblock)(BFCCommentListModel *)=^void(BFCCommentListModel *model){
NSLog(@"mlyx BFCCommentListModel model %@",model);

BFCCommentNoticeModel* noticeinfo=model.notice;
NSLog(@"mlyx notice title %@",noticeinfo.title);


model.notice=nil;
arg3(model);
};


%orig(arg2,hookblock,arg4);
}


%end
*/
