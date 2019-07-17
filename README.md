This script is a tool designed for checking if there is synchronisation/leack memory errors.
the script do the following steps :

**1.** check if make file exist and compilation passed.

**2.** run valgrind test and check if the program free all the allocations it consumed.

**3.** run helgrind test for detecting synchronisation errors.

The program return a number between 0-7 that represents which test passed our check.
bit 0 means the test passed.
bit 1 means the test failed.

the output will be like:

![](https://imagizer.imageshack.com/img922/1382/IofJP8.jpg)
