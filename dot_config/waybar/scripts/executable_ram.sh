#!/bin/bash
####################################


####################################
#           GET RAM SCRIPT         #
#                                  #
#################################### 

#----------------------------------#

##### Get total memory in KB #######

mem_total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
mem_available=$(grep MemAvailable /proc/meminfo | awk '{print $2}')


######################################

## Calculate used Memory Percentage ##

mem_used=$(( ( mem_total - mem_available ) * 100 / mem_total )) 


####################################

## Output the Value into waybar [ Waybar will replace {} with this ]

echo "$mem_used"


####################################









