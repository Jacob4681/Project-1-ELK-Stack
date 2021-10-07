#!/bin/bash

# bash script.sh 0315 02 PM

cat $1_Dealer_schedule | grep -i $2 | grep $3 | awk '{print $1, $2, $5, $6}'
