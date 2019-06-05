FROM centos:7

LABEL maintainer="Jaeyoung Chun (chunj@mskcc.org)" \
      version.bcl2fastq="2.20.0" \
      source.bcl2fastq="https://support.illumina.com/downloads/bcl2fastq-conversion-software-v2-20.html"

ENV BCL2FASTQ_VERSION_MAJOR 2
ENV BCL2FASTQ_VERSION_MINOR 20
ENV BCL2FASTQ_VERSION_REVISION 0

RUN yum install -y unzip

RUN cd /tmp/ && \
    curl -OL https://support.illumina.com/content/dam/illumina-support/documents/downloads/software/bcl2fastq/bcl2fastq2-v${BCL2FASTQ_VERSION_MAJOR}-${BCL2FASTQ_VERSION_MINOR}-${BCL2FASTQ_VERSION_REVISION}-linux-x86-64.zip && \
    unzip bcl2fastq2-v${BCL2FASTQ_VERSION_MAJOR}-${BCL2FASTQ_VERSION_MINOR}-${BCL2FASTQ_VERSION_REVISION}-linux-x86-64.zip && \
	rpm -i bcl2fastq2-v${BCL2FASTQ_VERSION_MAJOR}.${BCL2FASTQ_VERSION_MINOR}.${BCL2FASTQ_VERSION_REVISION}.422-Linux-x86_64.rpm && \
	rm -rf /tmp/bcl2fastq2-v${BCL2FASTQ_VERSION_MAJOR}-${BCL2FASTQ_VERSION_MINOR}-${BCL2FASTQ_VERSION_REVISION}-linux-x86-64.zip && \
	rm -rf /tmp/bcl2fastq2-v2.20.0.422-Linux-x86_64.rpm

ENTRYPOINT ["bcl2fastq"]
