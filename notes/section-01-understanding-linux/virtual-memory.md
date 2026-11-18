# Virtual Memory

## What is Virtual Memory?

Linux supports virtual memory: using a **disk as an extension of RAM**, so the effective size of usable memory grows.

How it works:

1. The kernel writes the contents of a currently unused block of memory to the hard disk
2. That memory can now be used for another purpose
3. When the original contents are needed again, they are read back into memory

All of this is **transparent to the user**. Programs only see the larger amount of memory and don't notice that parts of them sometimes reside on disk.

### Trade-off

Reading and writing the hard disk is on the order of **a thousand times slower** than real memory, so programs don't run as fast.

## Swap Space

The part of the hard disk used as virtual memory is called **swap space**.

Linux can use either:

|Option|Notes|
|---|---|
|Swap partition|Faster|
|Swap file (a normal file in the filesystem)|Easier to change the size, no need to repartition the whole disk and possibly reinstall everything|

### Which to Choose

|Situation|Choice|
|---|---|
|You know how much swap you need|Swap partition|
|You're uncertain|Start with a swap file, use the system for a while to get a feel for the amount, then make a swap partition once you're confident about the size|

### Multiple Swap Areas

Linux allows several swap partitions and/or swap files **at the same time**.

If you only occasionally need an unusual amount of swap, set up an extra swap file at such times instead of keeping the whole amount allocated all the time.

## Swapping vs Paging

Operating system terminology distinguishes two things:

|Term|Meaning|
|---|---|
|Swapping|Writing the **whole process** out to swap space|
|Paging|Writing only **fixed-size parts**, usually a few kilobytes, at a time|

Paging is usually more efficient, and that's what Linux does. Traditional Linux terminology still says "swapping" anyway.
