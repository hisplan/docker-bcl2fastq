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

path_data="$(pwd)/data/run-${run_id}/" 
path_output="$(pwd)/outputs/run-${run_id}/" 
mkdir -p ${path_output}

docker run -it --rm \
    -v "${path_data}":/data \
    -v "${path_output}":/output \
    bcl2fastq \
    --runfolder-dir /data \
    --output-dir /output \
    | tee ${path_output}/run.log
