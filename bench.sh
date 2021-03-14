#!/usr/bin/env sh

if [[ -z $1 ]]; then
    echo "Error must provide prog to time"
    exit 1
fi
SUB_PROG=$1

if [[ -z $2 ]]; then
    ITERATIONS=1
else
    ITERATIONS=$2
fi

echo -n $SUB_PROG $ITERATIONS times
time for i in `seq $ITERATIONS`; do
    $SUB_PROG
done
echo
