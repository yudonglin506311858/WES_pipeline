
################开始运行:3比对到基因组################################
ulimit -n 655350
cd /data9/yudonglin/zyy/WES
mkdir bwa
conda activate rnaseq
for i in {E4,E10,E16,E17,E9,EMP1,M11,M1,M12,M3_1,M3_2,M6,M9,M10,M14,P12,P13,P14};
do
bwa mem -t 30 -M /data/yudonglin/reference/human/hg19/bwa/hg19.fa  ./clean/${i}_1_val_1.fq.gz ./clean/${i}_2_val_2.fq.gz 1> ./bwa/${i}_trimmed.sam 2>>bwa.log;
done
################开始运行:3比对到基因组################################
