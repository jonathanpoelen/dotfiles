#!/bin/bash

coproc bc
exec 7>&${COPROC[1]}-
exec 2>&7-

for i in {1..100} ; do
	echo "$i*$i" >&2
	read r <&${COPROC[0]}
	echo $i:$r
done
