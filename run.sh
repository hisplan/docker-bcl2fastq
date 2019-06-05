#!/usr/bin/env bash

mkdir -p ./output

docker run -it --rm \
    -v "$(pwd)/data":/data \
    -v "$(pwd)/output":/output \
    bcl2fastq \
    --runfolder-dir /data \
    --output-dir /output \
    | tee ./output/run.log
