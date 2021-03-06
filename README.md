# PrettierTests

Tests to check how well Prettier scales with increasing file size and number of files. Used for essay 4 in IN4315: Software Architecture

## Info

OBS!: If you use vscode with the Prettier extension you can turn off formatting in this project by clicking "Disable (workspace)" in the settings menu when searching for Prettier in the extensions marketplace.

Run all scripts from the project root

## Prerequisite

- Node
- Npm
- (Bash for running helping scripts)

## Specs

The tests was ran on this computer:

- System: LENOVO_MT_20NX_BU_Think_FM_ThinkPad T490s
- Processor: Intel(R) Core(TM) i5-8265U CPU @ 1.60GHz, 1800 Mhz, 4 cores, 8 logical processors
- RAM: 16,0 GB
- Operating system: Windows 10 Pro 21H2 19044.1586
- node: v16.14.0
- npm/npx: v8.5.0

## About the tests

To have some consistency in the project we made Prettier format the code line:

```Javascript
var option = {Hello: "reader", This: { is: "a", weird: "formatted", text: "!",},};
```

which should turn into:

```Javascript
var option = {
  Hello: "reader",
  This: { is: "a", weird: "formatted", text: "!" },
};
```

Also noted that calling `time` before test shows that Prettier uses more time than reported.
(See relevant Prettier [issue](https://github.com/prettier/prettier/issues/3386))

```shell
$ time npx prettier --write LargeFile/large.js
LargeFile\large.js 4190ms

real    0m6.525s
user    0m0.061s
sys     0m0.120s
```

## Get started

Run: `npm install`

## Large file

Create large file can be done manually by copy paste code in file or running bash script:

`./Scripts/createLargeFile.sh numberOfLines`

Example:

`./Scripts/createLargeFile.sh 100`

Check large file:

`time npx prettier --write LargeFile/large.js`

### Test results

100 lines of code:

```
$ time npx prettier --write LargeFile/large.js
LargeFile\large.js 183ms

real    0m1.925s
user    0m0.030s
sys     0m0.167s
```

1000 lines of code:

```
$ time npx prettier --write LargeFile/large.js
LargeFile\large.js 591ms

real    0m2.268s
user    0m0.090s
sys     0m0.122s
```

2000 lines of code:

```
$ time npx prettier --write LargeFile/large.js
LargeFile\large.js 843ms

real    0m2.584s
user    0m0.060s
sys     0m0.105s
```

10000 lines of code:

```
$ time npx prettier --write LargeFile/large.js
LargeFile\large.js 5989ms

real    0m11.836s
user    0m0.167s
sys     0m0.540s
```

100000 lines of code:

```
$ time npx prettier --write LargeFile/large.js
LargeFile\large.js 49165ms

real    0m54.162s
user    0m0.092s
sys     0m0.276s
```

200000 lines of code:

```
$ time npx prettier --write LargeFile/large.js
LargeFile\large.js 199496ms

real    3m25.324s
user    0m0.136s
sys     0m0.277s
```

300000 lines of code:

```
npx prettier --write LargeFile/large.js
LargeFile\large.js

<--- Last few GCs --->

[8932:000001F6B81E30F0]    87753 ms: Mark-sweep (reduce) 4065.1 (4137.5) -> 4065.1 (4137.5) MB, 3939.1 / 0.0 ms  (average mu = 0.213, current mu = 0.000) last resort GC in old space requested
[8932:000001F6B81E30F0]    92455 ms: Mark-sweep (reduce) 4065.1 (4137.5) -> 4065.1 (4137.5) MB, 4702.0 / 0.0 ms  (average mu = 0.108, current mu = 0.000) last resort GC in old space requested


<--- JS stacktrace --->

FATAL ERROR: CALL_AND_RETRY_LAST Allocation failed - JavaScript heap out of memory
 1: 00007FF750957B7F v8::internal::CodeObjectRegistry::~CodeObjectRegistry+114079
 2: 00007FF7508E4546 DSA_meth_get_flags+65542
 3: 00007FF7508E53FD node::OnFatalError+301
 4: 00007FF75121B29E v8::Isolate::ReportExternalAllocationLimitReached+94
 5: 00007FF75120587D v8::SharedArrayBuffer::Externalize+781
 6: 00007FF7510A8C4C v8::internal::Heap::EphemeronKeyWriteBarrierFromCode+1468
 7: 00007FF7510A37EE v8::internal::Heap::AllocateExternalBackingStore+2270
 8: 00007FF7510C13F0 v8::internal::FreeListManyCached::Reset+1408
 9: 00007FF7510C1AA5 v8::internal::Factory::AllocateRaw+37
10: 00007FF7510D3A4E v8::internal::FactoryBase<v8::internal::Factory>::AllocateRawArray+46
11: 00007FF7510D668A v8::internal::FactoryBase<v8::internal::Factory>::NewFixedArrayWithFiller+74
12: 00007FF7510D68E3 v8::internal::FactoryBase<v8::internal::Factory>::NewFixedArrayWithMap+35
13: 00007FF750ED45D8 v8::internal::OrderedNameDictionary::Add<v8::internal::LocalIsolate>+856
14: 00007FF750ED4B97 v8::internal::OrderedNameDictionary::FindEntry<v8::internal::LocalIsolate>+247
15: 00007FF750ED4A24 v8::internal::OrderedHashTable<v8::internal::OrderedHashMap,2>::EnsureGrowable<v8::internal::Isolate>+100
16: 00007FF750E04F9F v8::internal::CompilationCache::IsEnabledScriptAndEval+5775
17: 00007FF7512A8F91 v8::internal::SetupIsolateDelegate::SetupHeap+494417
18: 00007FF751283B4B v8::internal::SetupIsolateDelegate::SetupHeap+341771
19: 000001F6B9E1A47F
```

## Many files

Creating many files can be done manually or running:

`./Scripts/createManyFiles.sh numberOfFiles`

Example:

`./Scripts/createManyFiles.sh 100`

Check run time for many files:

`npx prettier --write ManyFiles | ./Scripts/countManyFiles.sh`

100 files one line of javascript code:

```
$ time npx prettier --write ManyFiles | ./Scripts/countManyFiles.sh
Time used by Prettier: 823ms

real    0m12.816s
user    0m2.846s
sys     0m7.250s
```

1000 files one line of javascript code:

```
$ time npx prettier --write ManyFiles | ./Scripts/countManyFiles.sh
Time used by Prettier: 5116ms

real    1m37.498s
user    0m29.117s
sys     1m14.566s
```

2000 files one line of javascript code:

```
$ time npx prettier --write ManyFiles | ./Scripts/countManyFiles.sh
Time used by Prettier: 7745ms

real    5m16.821s
user    1m38.698s
sys     3m57.898s
```

10000 files one line of javascript code:

```
$ time npx prettier --write ManyFiles | ./Scripts/countManyFiles.sh
Time used by Prettier: 44522ms

real    23m56.831s
user    7m30.902s
sys     18m43.688s
```

## Many different files

Creating many different files can be done manually or running:

`./Scripts/createManyDifferentFiles.sh numberOfFilesTimesFive`

Example:

`./Scripts/createManyDifferentFiles.sh 100`

OBS! It will create five files for each number

Check run time for many files:

`npx prettier --write ManyDifferentFiles | ./Scripts/countManyFiles.sh`

100 files one line of js, css, json, md and ts code:

```
$ time npx prettier --write ManyDifferentFiles | ./Scripts/countManyFiles.sh
Time used by Prettier: 2153ms

real    0m19.480s
user    0m4.763s
sys     0m10.668s
```

1000 files one line of js, css, json, md and ts code:

```
$ time npx prettier --write ManyDifferentFiles | ./Scripts/countManyFiles.sh
Time used by Prettier: 5973ms

real    2m44.658s
user    0m50.611s
sys     2m3.707s
```

2000 files one line of js, css, json, md and ts code:

```
$ time npx prettier --write ManyDifferentFiles | ./Scripts/countManyFiles.sh
Time used by Prettier: 10228ms

real    5m20.225s
user    1m42.507s
sys     4m3.508s
```

10000 files one line of js, css, json, md and ts code:

```
$ time npx prettier --write ManyDifferentFiles | ./Scripts/countManyFiles.sh
Time used by Prettier: 52160ms

real    23m24.805s
user    7m23.720s
sys     18m22.995s
```

## Testing with [PPrettier](https://github.com/microsoft/parallel-prettier)

Run: `npm install -g @mixer/parallel-prettier` (Has to be downloaded globally)

## Large file

Create large file can be done manually by copy paste code in file or running bash script:

`./Scripts/createLargeFile.sh numberOfLines`

Example:

`./Scripts/createLargeFile.sh 100`

Check large file:

`time pprettier --write LargeFile/large.js`

### Test results

100 lines of code:

```
$ time pprettier --write LargeFile/large.js
large.js
??? Reformatted 1 / 1 files...

real    0m1.168s
user    0m0.090s
sys     0m0.077s
```

1000 lines of code:

```
$ time pprettier --write LargeFile/large.js
large.js
??? Reformatted 1 / 1 files...

real    0m1.713s
user    0m0.030s
sys     0m0.121s
```

2000 lines of code:

```
$ time pprettier --write LargeFile/large.js
large.js
??? Reformatted 1 / 1 files...

real    0m1.814s
user    0m0.060s
sys     0m0.107s
```

10000 lines of code:

```
$ time pprettier --write LargeFile/large.js
large.js
??? Reformatted 1 / 1 files...

real    0m3.441s
user    0m0.045s
sys     0m0.061s
```

100000 lines of code:
```
$ time pprettier --write LargeFile/large.js
large.js
??? Reformatted 1 / 1 files...

real    0m53.570s
user    0m0.107s
sys     0m0.152s
```

200000 lines of code:

```
$ time pprettier --write LargeFile/large.js
large.js
??? Reformatted 1 / 1 files...

real    2m52.615s
user    0m0.030s
sys     0m0.213s
```

300000 lines of code:

```
$ time pprettier --write LargeFile/large.js
??? Starting...
<--- Last few GCs --->

[10836:0000019458C2BDB0]    91796 ms: Mark-sweep (reduce) 4071.5 (4143.4) -> 4070.5 (4143.6) MB, 5414.1 / 0.0 ms  (average mu = 0.088, current mu = 0.001) allocation failure scavenge might not succeed     
                                                                                                                                                                                              ot succeed     


-??? Starting... JS stacktrace --->

FATAL ERROR: Ineffective mark-compacts near heap limit Allocation failed - JavaScript heap out of memory
??? Starting... 1: 00007FF6A9BC7B7F v8::internal::CodeObjectRegistry::~CodeObjectRegistry+114079
 2: 00007FF6A9B54546 DSA_meth_get_flags+65542
 3: 00007FF6A9B553FD node::OnFatalError+301
0007FF6AA48B29E v8::Isolate::??? Starting...ReportExternalAllocationLimitReached+94
 5: 00007FF6AA47587D v8::SharedArrayBuffer::Externalize+781
 6: 00007FF6AA318C4C v8::internal::Heap::EphemeronKeyWriteBarrierFromCode+1468
 7: 00007FF6AA3258F9 v8::internal::Heap::PublishPendingAllocations+1129
 8: 00007FF6AA3228CA v8::internal::Heap::PageFlagsAreConsistent+2842
 9: 00007FF6AA315529 v8::internal::Heap::CollectGarbage+2137
10: 00007FF6AA3136E0 v8::internal::Heap::AllocateExternalBackingStore+2000
11: 00007FF6AA338266 v8::internal::Factory::NewFillerObject+214
12: 00007FF6AA06A735 v8::internal::DateCache::Weekday+1797
13: 00007FF6AA518F91 v8::internal::SetupIsolateDelegate::SetupHeap+494417
14: 000001945AB4A33A
??? Starting...C:\Users\hallv\AppData\Roaming\npm\node_modules\@mixer\parallel-prettier\node_modules\rxjs\internal\util\hostReportError.js:4
    setTimeout(function () { throw err; }, 0);
                             ^

WorkerExitedError: Worker exited with unexpected 134 code
    at Worker.<anonymous> (C:\Users\hallv\AppData\Roaming\npm\node_modules\@mixer\parallel-prettier\dist\worker-pool.js:57:59)
    at Worker.emit (node:events:520:28)
    at ChildProcess.<anonymous> (node:internal/cluster/primary:202:12)
    at Object.onceWrapper (node:events:640:26)
    at ChildProcess.emit (node:events:520:28)
    at Process.ChildProcess._handle.onexit (node:internal/child_process:291:12)

real    1m44.532s
user    0m0.060s
sys     0m0.137s
```

## Many files

Creating many files can be done manually or running:

`./Scripts/createManyFiles.sh numberOfFiles`

Example:

`./Scripts/createManyFiles.sh 100`

Check run time for many files:

`time pprettier --write "ManyFiles/*"`

100 files one line of javascript code:

```
$ time pprettier --write "ManyFiles/*"
??? Reformatted 100 / 100 files...

real    0m2.356s
user    0m0.030s
sys     0m0.121s
```

1000 files one line of javascript code:

```
$ time pprettier --write "ManyFiles/*"
??? Reformatted 1000 / 1000 files...

real    0m7.916s
user    0m0.045s
sys     0m0.107s
```

2000 files one line of javascript code:

```
$ time pprettier --write "ManyFiles/*"
??? Reformatted 2000 / 2000 files...

real    0m10.570s
user    0m0.091s
sys     0m0.153s
```

10000 files one line of javascript code:

```
$ time pprettier --write "ManyFiles/*"
??? Reformatted 10000 / 10000 files...

real    0m27.429s
user    0m0.000s
sys     0m0.198s
```

## Many different files

Creating many different files can be done manually or running:

`./Scripts/createManyDifferentFiles.sh numberOfFilesTimesFive`

Example:

`./Scripts/createManyDifferentFiles.sh 100`

OBS! It will create five files for each number

Check run time for many files:

`$ time pprettier --write "ManyDifferentFiles/*"`

100 files one line of js, css, json, md and ts code:

```
$  time pprettier --write "ManyDifferentFiles/*"
??? Reformatted 100 / 100 files...

real    0m2.606s
user    0m0.015s
sys     0m0.121s
```

1000 files one line of js, css, json, md and ts code:

```
$  time pprettier --write "ManyDifferentFiles/*"
??? Reformatted 1000 / 1000 files...

real    0m7.854s
user    0m0.075s
sys     0m0.060s
```

2000 files one line of js, css, json, md and ts code:

```
$  time pprettier --write "ManyDifferentFiles/*"
??? Reformatted 2000 / 2000 files...

real    0m11.357s
user    0m0.091s
sys     0m0.060s
```

10000 files one line of js, css, json, md and ts code:

```
$  time pprettier --write "ManyDifferentFiles/*"
??? Reformatted 10000 / 10000 files...

real    0m27.310s
user    0m0.076s
sys     0m0.092s
```
