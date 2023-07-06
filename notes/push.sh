#!/bin/bash

RET=1
while [ $RET -gt 0 ]; do
    git push 
    [ $? -eq 0 ] && RET=0
done
 

