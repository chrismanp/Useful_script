Find open source code that uses memory protection such as watchpoint,
garbage collection, persistence store, and others and get a statistics
on how much "memory unprotect", "memory protect" was used, the number
of interrupt that user can handle, number of system call, number of
total interrupt, etc (basically trying to get a sense of the workload
and whether it make sense to use our method)

Statistics :
1. Memory unprotect  (count the Macros UNPROTECT)
2. Memory protect    (count the Macros PROTECT)
3. The number of interrupt that user can handle  (number of segfault or due to write protection + handling memory that user shouldn't even touch) 
4. Number of interrupt (doesn't seems to be something that we can count)
5. Number of system call (use strace.so)

Evaluation :
1. Memory unprotect -> Speed up calculated
2. Number of system call called (mprotect, alloc, etc.) (Doesn't seem like a fair comparison since the each system call have different timing)
3. Number of segfault call -> Number of write protection -> Speed up if using a user

Update :
Number of mprotect (124282) againts total number of other system call other(15344) 
Number unprotect (120601) vs protect (3668)
Number of save up on segment fault (199)

What is the number of collection when running the garbage collection, what does it mean? The number of time a garbage collection was performed. 
How to do a fair comparison between incremental gc vs no incremental gc? No need to do a fair comparison.


---------------------------------------------------------------------------------------
Eager amplification :

GC Warning: Memory unmapping is disabled as incompatible with MPROTECT_VDB
Garbage Collector Test
 Live storage will peak at 10291408 bytes.

 Stretching memory with a binary tree of depth 18
 Creating a long-lived binary tree of depth 16
 Creating a long-lived array of 500000 doubles
Creating 33824 trees of depth 4
	Top down construction took 90 msec
	Bottom up construction took 62 msec
Creating 8256 trees of depth 6
	Top down construction took 85 msec
	Bottom up construction took 68 msec
Creating 2052 trees of depth 8
	Top down construction took 60 msec
	Bottom up construction took 58 msec
Creating 512 trees of depth 10
	Top down construction took 56 msec
	Bottom up construction took 71 msec
Creating 128 trees of depth 12
	Top down construction took 70 msec
	Bottom up construction took 69 msec
Creating 32 trees of depth 14
	Top down construction took 80 msec
	Bottom up construction took 87 msec
Creating 8 trees of depth 16
	Top down construction took 76 msec
	Bottom up construction took 80 msec
Completed in 1104 msec
Completed 246 collections
Heap size is 35840000

/GCBench 
GC Warning: Memory unmapping is disabled as incompatible with MPROTECT_VDB
Garbage Collector Test
 Live storage will peak at 10291408 bytes.

 Stretching memory with a binary tree of depth 18
 Creating a long-lived binary tree of depth 16
 Creating a long-lived array of 500000 doubles
Creating 33824 trees of depth 4
	Top down construction took 65 msec
	Bottom up construction took 56 msec
Creating 8256 trees of depth 6
	Top down construction took 68 msec
	Bottom up construction took 68 msec
Creating 2052 trees of depth 8
	Top down construction took 54 msec
	Bottom up construction took 55 msec
Creating 512 trees of depth 10
	Top down construction took 67 msec
	Bottom up construction took 51 msec
Creating 128 trees of depth 12
	Top down construction took 61 msec
	Bottom up construction took 69 msec
Creating 32 trees of depth 14
	Top down construction took 94 msec
	Bottom up construction took 91 msec
Creating 8 trees of depth 16
	Top down construction took 93 msec
	Bottom up construction took 104 msec
Completed in 1081 msec
Completed 250 collections
Heap size is 35840000

/GCBench 
GC Warning: Memory unmapping is disabled as incompatible with MPROTECT_VDB
Garbage Collector Test
 Live storage will peak at 10291408 bytes.

 Stretching memory with a binary tree of depth 18
 Creating a long-lived binary tree of depth 16
 Creating a long-lived array of 500000 doubles
Creating 33824 trees of depth 4
	Top down construction took 61 msec
	Bottom up construction took 55 msec
Creating 8256 trees of depth 6
	Top down construction took 57 msec
	Bottom up construction took 58 msec
Creating 2052 trees of depth 8
	Top down construction took 56 msec
	Bottom up construction took 75 msec
Creating 512 trees of depth 10
	Top down construction took 56 msec
	Bottom up construction took 57 msec
Creating 128 trees of depth 12
	Top down construction took 55 msec
	Bottom up construction took 64 msec
Creating 32 trees of depth 14
	Top down construction took 66 msec
	Bottom up construction took 77 msec
Creating 8 trees of depth 16
	Top down construction took 79 msec
	Bottom up construction took 89 msec
Completed in 988 msec
Completed 250 collections
Heap size is 35840000

/GCBench 
GC Warning: Memory unmapping is disabled as incompatible with MPROTECT_VDB
Garbage Collector Test
 Live storage will peak at 10291408 bytes.

 Stretching memory with a binary tree of depth 18
 Creating a long-lived binary tree of depth 16
 Creating a long-lived array of 500000 doubles
Creating 33824 trees of depth 4
	Top down construction took 56 msec
	Bottom up construction took 58 msec
Creating 8256 trees of depth 6
	Top down construction took 53 msec
	Bottom up construction took 65 msec
Creating 2052 trees of depth 8
	Top down construction took 52 msec
	Bottom up construction took 57 msec
Creating 512 trees of depth 10
	Top down construction took 54 msec
	Bottom up construction took 59 msec
Creating 128 trees of depth 12
	Top down construction took 54 msec
	Bottom up construction took 62 msec
Creating 32 trees of depth 14
	Top down construction took 68 msec
	Bottom up construction took 76 msec
Creating 8 trees of depth 16
	Top down construction took 75 msec
	Bottom up construction took 78 msec
Completed in 937 msec
Completed 249 collections
Heap size is 28975104

/GCBench 
GC Warning: Memory unmapping is disabled as incompatible with MPROTECT_VDB
Garbage Collector Test
 Live storage will peak at 10291408 bytes.

 Stretching memory with a binary tree of depth 18
 Creating a long-lived binary tree of depth 16
 Creating a long-lived array of 500000 doubles
Creating 33824 trees of depth 4
	Top down construction took 73 msec
	Bottom up construction took 82 msec
Creating 8256 trees of depth 6
	Top down construction took 71 msec
	Bottom up construction took 59 msec
Creating 2052 trees of depth 8
	Top down construction took 57 msec
	Bottom up construction took 62 msec
Creating 512 trees of depth 10
	Top down construction took 54 msec
	Bottom up construction took 58 msec
Creating 128 trees of depth 12
	Top down construction took 62 msec
	Bottom up construction took 65 msec
Creating 32 trees of depth 14
	Top down construction took 78 msec
	Bottom up construction took 81 msec
Creating 8 trees of depth 16
	Top down construction took 91 msec
	Bottom up construction took 88 msec
Completed in 1063 msec
Completed 250 collections
Heap size is 28975104


-----------------------------------
No eager amplification

/GCBench 
GC Warning: Memory unmapping is disabled as incompatible with MPROTECT_VDB
Garbage Collector Test
 Live storage will peak at 10291408 bytes.

 Stretching memory with a binary tree of depth 18
 Creating a long-lived binary tree of depth 16
 Creating a long-lived array of 500000 doubles
Creating 33824 trees of depth 4
	Top down construction took 110 msec
	Bottom up construction took 98 msec
Creating 8256 trees of depth 6
	Top down construction took 99 msec
	Bottom up construction took 92 msec
Creating 2052 trees of depth 8
	Top down construction took 75 msec
	Bottom up construction took 78 msec
Creating 512 trees of depth 10
	Top down construction took 77 msec
	Bottom up construction took 84 msec
Creating 128 trees of depth 12
	Top down construction took 83 msec
	Bottom up construction took 109 msec
Creating 32 trees of depth 14
	Top down construction took 100 msec
	Bottom up construction took 99 msec
Creating 8 trees of depth 16
	Top down construction took 107 msec
	Bottom up construction took 130 msec
Completed in 1435 msec
Completed 248 collections
Heap size is 35840000


/GCBench 
GC Warning: Memory unmapping is disabled as incompatible with MPROTECT_VDB
Garbage Collector Test
 Live storage will peak at 10291408 bytes.

 Stretching memory with a binary tree of depth 18
 Creating a long-lived binary tree of depth 16
 Creating a long-lived array of 500000 doubles
Creating 33824 trees of depth 4
	Top down construction took 81 msec
	Bottom up construction took 80 msec
Creating 8256 trees of depth 6
	Top down construction took 78 msec
	Bottom up construction took 80 msec
Creating 2052 trees of depth 8
	Top down construction took 79 msec
	Bottom up construction took 96 msec
Creating 512 trees of depth 10
	Top down construction took 73 msec
	Bottom up construction took 82 msec
Creating 128 trees of depth 12
	Top down construction took 81 msec
	Bottom up construction took 97 msec
Creating 32 trees of depth 14
	Top down construction took 138 msec
	Bottom up construction took 101 msec
Creating 8 trees of depth 16
	Top down construction took 128 msec
	Bottom up construction took 96 msec
Completed in 1372 msec
Completed 250 collections
Heap size is 37363712

/GCBench 
GC Warning: Memory unmapping is disabled as incompatible with MPROTECT_VDB
Garbage Collector Test
 Live storage will peak at 10291408 bytes.

 Stretching memory with a binary tree of depth 18
 Creating a long-lived binary tree of depth 16
 Creating a long-lived array of 500000 doubles
Creating 33824 trees of depth 4
	Top down construction took 92 msec
	Bottom up construction took 79 msec
Creating 8256 trees of depth 6
	Top down construction took 85 msec
	Bottom up construction took 89 msec
Creating 2052 trees of depth 8
	Top down construction took 93 msec
	Bottom up construction took 94 msec
Creating 512 trees of depth 10
	Top down construction took 99 msec
	Bottom up construction took 100 msec
Creating 128 trees of depth 12
	Top down construction took 92 msec
	Bottom up construction took 88 msec
Creating 32 trees of depth 14
	Top down construction took 102 msec
	Bottom up construction took 103 msec
Creating 8 trees of depth 16
	Top down construction took 123 msec
	Bottom up construction took 102 msec
Completed in 1412 msec
Completed 250 collections
Heap size is 37363712

/GCBench 
GC Warning: Memory unmapping is disabled as incompatible with MPROTECT_VDB
Garbage Collector Test
 Live storage will peak at 10291408 bytes.

 Stretching memory with a binary tree of depth 18
 Creating a long-lived binary tree of depth 16
 Creating a long-lived array of 500000 doubles
Creating 33824 trees of depth 4
	Top down construction took 93 msec
	Bottom up construction took 109 msec
Creating 8256 trees of depth 6
	Top down construction took 82 msec
	Bottom up construction took 80 msec
Creating 2052 trees of depth 8
	Top down construction took 79 msec
	Bottom up construction took 83 msec
Creating 512 trees of depth 10
	Top down construction took 98 msec
	Bottom up construction took 79 msec
Creating 128 trees of depth 12
	Top down construction took 81 msec
	Bottom up construction took 83 msec
Creating 32 trees of depth 14
	Top down construction took 95 msec
	Bottom up construction took 108 msec
Creating 8 trees of depth 16
	Top down construction took 121 msec
	Bottom up construction took 128 msec
Completed in 1412 msec
Completed 246 collections
Heap size is 37363712

/GCBench 
GC Warning: Memory unmapping is disabled as incompatible with MPROTECT_VDB
Garbage Collector Test
 Live storage will peak at 10291408 bytes.

 Stretching memory with a binary tree of depth 18
 Creating a long-lived binary tree of depth 16
 Creating a long-lived array of 500000 doubles
Creating 33824 trees of depth 4
	Top down construction took 86 msec
	Bottom up construction took 97 msec
Creating 8256 trees of depth 6
	Top down construction took 74 msec
	Bottom up construction took 82 msec
Creating 2052 trees of depth 8
	Top down construction took 79 msec
	Bottom up construction took 83 msec
Creating 512 trees of depth 10
	Top down construction took 78 msec
	Bottom up construction took 82 msec
Creating 128 trees of depth 12
	Top down construction took 84 msec
	Bottom up construction took 83 msec
Creating 32 trees of depth 14
	Top down construction took 91 msec
	Bottom up construction took 104 msec
Creating 8 trees of depth 16
	Top down construction took 100 msec
	Bottom up construction took 97 msec
Completed in 1301 msec
Completed 248 collections
Heap size is 37363712


/GCBench 
GC Warning: Memory unmapping is disabled as incompatible with MPROTECT_VDB
Garbage Collector Test
 Live storage will peak at 10291408 bytes.

 Stretching memory with a binary tree of depth 18
 Creating a long-lived binary tree of depth 16
 Creating a long-lived array of 500000 doubles
Creating 33824 trees of depth 4
	Top down construction took 83 msec
	Bottom up construction took 86 msec
Creating 8256 trees of depth 6
	Top down construction took 79 msec
	Bottom up construction took 80 msec
Creating 2052 trees of depth 8
	Top down construction took 100 msec
	Bottom up construction took 88 msec
Creating 512 trees of depth 10
	Top down construction took 88 msec
	Bottom up construction took 97 msec
Creating 128 trees of depth 12
	Top down construction took 89 msec
	Bottom up construction took 101 msec
Creating 32 trees of depth 14
	Top down construction took 123 msec
	Bottom up construction took 124 msec
Creating 8 trees of depth 16
	Top down construction took 100 msec
	Bottom up construction took 121 msec
Completed in 1461 msec
Completed 248 collections
Heap size is 37363712



