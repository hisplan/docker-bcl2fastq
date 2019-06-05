#!/usr/bin/env bash

usage()
{
cat << EOF
USAGE: `basename $0` [options]
    -r  run ID (e.g. 185407224)
EOF
}

while getopts "r:h" OPTION
do
    case $OPTION in
        r) run_id=$OPTARG ;;
        h) usage; exit 1 ;;
        *) usage; exit 1 ;;
    esac
done

if [ -z "$run_id" ]
then
    usage
    exit 1
fi

bs-cp -v https://basespace.illumina.com/Run/${run_id} ./data
