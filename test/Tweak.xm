%hook CAWindowServerDisplay
-(unsigned)contextIdAtPosition:(CGPoint)arg1 excludingContextIds:(id)arg2{ 
  NSLog(@"mlyx contextIdAtPosition:(CGPoint){%g, %g} excludingContextIds:(id)%@  return %d",arg1.x,arg1.y,arg2,%orig);
  return %orig;
}
%end
