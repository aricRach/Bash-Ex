#!/bin/bash

# initialize vairabels 
CMP="Fail"
VLG="Fail"
HLG="Fail"

CMPBIT=4
VLGBIT=2
HLGBIT=1

# check if there is makeFile in 'dir path'
# egrep is regex for return '0' or '1'
cd "$1"
if(true)
then
    if(true) # check if compilation passed
    then
        CMP="Pass"
        CMPBIT=0
     # ./a.out # Option for run the program
    
    valgrind --leak-check=full -v ./a.out chmod a+x > Valgrind.txt 2>&1 # memory leaks check,chmod a+x- gives permission

     if(grep -q "ERROR SUMMARY: 0 errors" "Valgrind.txt") # check valgrind result
    then
        VLG="Pass"
        VLGBIT=0
     fi
    
    valgrind --tool=helgrind chmod a+x ./a.out > Helgrind.txt 2>&1 # check thread race
   
     if(grep -q "ERROR SUMMARY: 0 errors" "Helgrind.txt") # check helgrind result
    then
        HLG="Pass"
        HLGBIT=0
     fi
     
     fi

fi
    # print the results 
     echo "Compilation\tMemory leaks\tthread race"
     echo $CMP "\t\t" $VLG "\t\t" $HLG 

Total=$(($HLGBIT+$VLGBIT+$CMPBIT))
exit $Total
