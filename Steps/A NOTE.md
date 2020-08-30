## Source
- control
- Tweak.xm
- Tweak.plist
## 1. Theos
```
$THEOS/bin/logos.pl  Tweak.xm > Tweak.xm.mm
```
#### x
- Logos,Objective-C,C
#### xm
- Logos,Objective-C,C,C++
#### m
- Objective-C,C
#### mm
- Objective-C,C,C++

Tweak.x > Tweak.x.m 
Tweak.xm > Tweak.xm.mm

## 2. substrate
### %config(generator=internal) vs %config(generator=MobileSubstrate)
logos.pl 默认使用%config(generator=MobileSubstrate)，hook OC会使用MSHookMessageEx
%config(generator=internal)，hook OC会使用OC Runtime, method_exchangeImplementations

最好使用internal，默认MobileSubstrate 会include <substrate.h>,在Theos下编译无问题，但是手动编译出错
```
//Tweak.xm
%config(generator=internal)
```
注意: logos.pl 默认使用%config(generator=MobileSubstrate),生成的.mm 会重复include substrate.h, 非theos自动编译下，都使用internal 模式

### 如果需要hook 系统C库函数， 需要使用MSHookFunction
- add substrate.h 
- add libsubstrate.dylib 
```
//Tweak.xm
#import "substrate.h"
%config(generator=internal)
```


## 3. Compile
```
clang++ -arch arm64 -arch arm64e -fobjc-arc -miphoneos-version-min=13.0 -isysroot ~/theos/sdks/iPhoneOS13.6.1.sdk -Wall -O2 -c -o Tweak.xm.o Tweak.xm.mm
```

## 4. Link
```
clang++ -arch arm64 -arch arm64e -fobjc-arc -miphoneos-version-min=13.0 -isysroot ~/theos/sdks/iPhoneOS13.6.1.sdk -Wall -O2 -fcolor-diagnostics  -framework Foundation -framework UIKit -lsubstrate -lobjc -lc++ -L./ -dynamiclib -ggdb -lsystem.b -Xlinker -segalign -Xlinker 4000 -o Tweak.dylib Tweak.xm.o 
```


## 5. Code signing
```
ldid -S Tweak.dylib
```
## 6. Package
```
mkdir -p .packaging/Library/MobileSubstrate/DynamicLibraries
mkdir .packaging/DEBIAN

cp Tweak.dylib .packaging/Library/MobileSubstrate/DynamicLibraries/Tweak.dylib
cp Tweak.plist .packaging/Library/MobileSubstrate/DynamicLibraries/Tweak.plist
cp control .packaging/DEBIAN/control

dpkg-deb --build -Zgzip -z9 .packaging .
```


## Options

```
clang++ is a compiler in the llvm project capable of compiling c++ code
-arch <archname> specifies we are compiling for a specific arch. In this example, we're going to lazily compile all of them at once.

-fobjc-arc tells clang that we're using Automated Reference Counting.

-miphoneos-version-min=13.0 specifies our target iOS version.

-isysroot <directory> Tells clang where our sdk root directory is.

-Wall tells clang to enable all of its warning modules. You should keep this on, warnings are annoying, but unexpected behavior is much more so.

-O2 (Letter 'O') tells the compiler to optimize at level 2. This can be set to -O0 (Letter 'O', number 'Zero') to disable optimization if it causes problems.

-c Tells clang to compile, but not yet link the file.

-o Tweak.xm.o specifies the output file

Any other text in the command is evaluated as an input file. So, in this case, Tweak.xm.mm.

Repeat this process for all files that need compiled (.m, other .xm files, etc)

-framework <Framework Name> tells our linker we're going to be linking against a specific framework. We only specify what we need here.

-l<library name> specifies a library we want to link against. We link against libsubstrate, libobjc, libc++ and libsystem.b,

-L<directory> specifies a library search directory.

-dynamiclib specifies we're compiling a linking dynamically

-ggdb tells our linker to produce debugging information for ggdb.

-Xlinker passes arguments to the linker that clang doesn't recognize. We pass the below flag to our mach-o linker.

-segalign 4000 aligns our segments at 0x4000. See https://www.manpagez.com/man/1/ld/osx-10.4.php if you're curios as to why.
```