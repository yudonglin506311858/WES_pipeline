
################开始运行:1质控################################
cd /data9/yudonglin/zyy/WES
conda activate rnaseq
mkdir fastqc_before
#质量控制
fastqc -t 20 *.gz -o ./fastqc_before
cd ./fastqc_before
multiqc ./


mkdir fastqc_after
#质量控制
fastqc -t 30 -o ./fastqc_after/ ./clean/*.gz
################开始运行:1质控################################
