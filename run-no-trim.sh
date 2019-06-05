#!/usr/bin/env bash

mkdir -p ./output

docker run -it --rm \
    -v "$(pwd)/data":/data \
    -v "$(pwd)/output":/output \
    bcl2fastq \
    --runfolder-dir /data \
    --output-dir /output \
    --minimum-trimmed-read-length 0 \
    --mask-short-adapter-reads 0 \
    | tee ./output/run.log
