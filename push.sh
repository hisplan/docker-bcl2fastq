#!/usr/bin/env bash

docker login
docker tag bcl2fastq hisplan/bcl2fastq:2.20.0
docker push hisplan/bcl2fastq:2.20.0
