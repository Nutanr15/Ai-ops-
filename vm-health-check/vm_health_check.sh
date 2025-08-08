#!/bin/bash

# Threshold for CPU, memory, and disk usage (percentage)
THRESHOLD=60

# Function to get CPU usage (percentage)
get_cpu_usage() {
    # Get the idle CPU percentage from top, then calculate used CPU
    idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d'.' -f1)
    cpu_used=$((100 - idle))
    echo $cpu_used
}

# Function to get memory usage (percentage)
get_mem_usage() {
    # Get used/total memory from free, then calculate percentage
    mem=$(free | grep Mem)
    total=$(echo $mem | awk '{print $2}')
    used=$(echo $mem | awk '{print $3}')
    mem_used=$((used * 100 / total))
    echo $mem_used
}

# Function to get disk usage (percentage, root partition)
get_disk_usage() {
    disk_used=$(df --output=pcent / | tail -1 | tr -dc '0-9')
    echo $disk_used
}

# Parse command-line arguments
EXPLAIN=0
if [[ "$1" == "explain" ]]; then
    EXPLAIN=1
fi

# Gather usage stats
CPU_USAGE=$(get_cpu_usage)
MEM_USAGE=$(get_mem_usage)
DISK_USAGE=$(get_disk_usage)

HEALTHY=1
REASONS=()

if (( CPU_USAGE > THRESHOLD )); then
    HEALTHY=0
    REASONS+=("CPU usage is ${CPU_USAGE}% (above ${THRESHOLD}%)")
fi

if (( MEM_USAGE > THRESHOLD )); then
    HEALTHY=0
    REASONS+=("Memory usage is ${MEM_USAGE}% (above ${THRESHOLD}%)")
fi

if (( DISK_USAGE > THRESHOLD )); then
    HEALTHY=0
    REASONS+=("Disk usage is ${DISK_USAGE}% (above ${THRESHOLD}%)")
fi

if (( HEALTHY )); then
    STATUS="Healthy"
    [ $EXPLAIN -eq 1 ] && echo "All system parameters are below ${THRESHOLD}% utilization."
else
    STATUS="Not healthy"
    if [ $EXPLAIN -eq 1 ]; then
        echo "Reason(s) for not healthy status:"
        for reason in "${REASONS[@]}"; do
            echo "- $reason"
        done
    fi
fi

echo "VM health status: $STATUS"
