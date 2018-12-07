#!/bin/bash
set -eo pipefail

declare server="$1"

if [[ -z "$1" ]]; then
	echo "error: must specify server."
	echo "Usage: $0 <iperf-server-addr>"
	exit 1
fi

start_transfer() {
	local speed=$(( RANDOM % 32 ))
	local time=$(( RANDOM % 20 * 10 ))
	local delay=$(( RANDOM % 20 * 10 ))
	echo "---> waiting ${delay}s"
	sleep "${delay}s"
	local cmd="iperf -c $server -u -b ${speed}M -t $time -i 10"
	echo "$cmd"
	exec $cmd
}

for i in $(seq 1 5); do
	{
		while true; do
			start_transfer
		done
	} &
done



