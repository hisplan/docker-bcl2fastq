#!/usr/bin/env bash

docker login
docker tag bcl2fastq hisplan/bcl2fastq
docker push hisplan/bcl2fastq
