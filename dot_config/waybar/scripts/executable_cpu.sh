

#!/bin/bash

##############################
#                            # 
#         CPU SCRIPT         #
#                            # 
##############################

#----------------------------#

## Gets cpu usage from /proc/start 

## Reads first line ( gets all cpus )

	cpu_line1=($(head -n1 /proc/stat))

## Extracts the values from all CPUs

	user1=${cpu_line1[1]}
	nice1=${cpu_line1[2]}
	system1=${cpu_line1[3]}
	idle1=${cpu_line1[4]}
	iowait1=${cpu_line1[5]}
	irq1=${cpu_line1[6]}
	softirq1=${cpu_line1[7]}
	steal1=${cpu_line1[8]}

## Calculates the total and idle time 

	total1=$((user1 + nice1 + system1 + idle1 + iowait1 + irq1 + softirq1 + steal1))
	idle_total1=$((idle1 + iowait1))


## Waits a short moment 

	sleep 0.5


## Reads a second snapshot 

	cpu_line2=($(head -n1 /proc/stat))

## Extracts the values again

	user2=${cpu_line2[1]}
	nice2=${cpu_line2[2]}
	system2=${cpu_line2[3]}
	idle2=${cpu_line2[4]}
	iowait2=${cpu_line2[5]}
	irq2=${cpu_line2[6]}
	softirq2=${cpu_line2[7]}
	steal2=${cpu_line2[8]}

## Second Calculation 

	total2=$((user2 + nice2 + system2 + idle2 + iowait2 + irq2 + softirq2 + steal2))
	idle_total2=$((idle2 + iowait2))

## Calculates the Difference 

	total_diff=$((total2 - total1))
	idle_diff=$((idle_total2 - idle_total1))

## Gets the usage percentage 

	usage=$((100 * (total_diff - idle_diff) / total_diff))
	
## Echos the percentage number 

	echo "$usage"


################################################


