#!/bin/bash

echo "please enter the number:"
read Number

if [ $(($NUMBER %2))  -eq 0 ]; then
   echo "Given number $NUMBER is EVEN"
else 
   echo "Given number $NUMBER IS OOD"
fi