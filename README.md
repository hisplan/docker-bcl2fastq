# docker-bcl2fastq

## BaseSpace Command Line Interface (CLI)

https://developer.basespace.illumina.com/docs/content/documentation/cli/cli-overview

https://support.illumina.com/bulletins/2017/02/options-for-downloading-run-folders-from-basespace-sequence-hub.html


```
wget "https://api.bintray.com/content/basespace/BaseSpaceCLI-EarlyAccess-BIN/latest/\$latest/amd64-osx/bs?bt_package=latest" -O /usr/local/bin/bs

wget https://api.bintray.com/content/basespace/BaseSpace-Copy-BIN/\$latest/osx/bscp?bt_package=develop -O /usr/local/bin/bs-cp


chmod u+x /usr/local/bin/bs
chmod u+x /usr/local/bin/bs-cp
```


```
bs auth
```

```
bs list run
```

```
$ bs list run | head
+------------------------------------+-----------+------------------------------------+----------+
|                Name                |    Id     |           ExperimentName           |  Status  |
+------------------------------------+-----------+------------------------------------+----------+
| 190531_M04540_0121_000000000-D66VJ | 186690504 | Tamella_hash_3                     | Complete |
| 190530_M04540_0120_000000000-D676Y | 186359173 | Tamella_hash_2                     | Complete |
| 190528_M04540_0119_000000000-D66GJ | 185407224 | Hashtags_Tammela_01                | Complete |
| 190315_M04540_0118_000000000-BDF25 | 168257103 | InDrop_V2_Senescence               | Complete |
| 190220_M04540_0117_000000000-D3R8W | 162065909 | AD2_280X                           | Complete |
| 190129_M04540_0116_000000000-D3N4F | 156773629 | BLID74-1_SSS                       | Complete |
...
```

```
bs-cp -v https://basespace.illumina.com/Run/185407224 .
```


```
2019-06-05 18:17:18 [1699880] WARNING: Option: '--minimum-trimmed-read-length' with value: 35 is being overwritten by the shortest non-index read length: 20
```

## 10x Gene Expression

Not working that well...

```bash
#!/bin/bash

path_data="$(pwd)/AGRF_CAGRF14386_CAUC0ANXX"
path_output="$(pwd)/test-out"

mkdir -p ${path_output}

docker run -it --rm \
  -v "${path_data}":/data \
  -v "${path_output}":/output \
  hisplan/bcl2fastq \
  --runfolder-dir /data \
  --output-dir /output \
  --sample-sheet /data/SampleSheet.csv \
  --use-bases-mask=Y26n*,I8n,Y101n* \
  --create-fastq-for-index-reads \
  --minimum-trimmed-read-length=8 \
  --mask-short-adapter-reads=8 \
  --ignore-missing-positions \
  --ignore-missing-controls \
  --ignore-missing-filter \
  --ignore-missing-bcls \
  | tee ${path_output}/run.log
```
