
################开始运行:2数据过滤################################
ulimit -n 655350
cd /data9/yudonglin/zyy/WES
mkdir bwa
conda activate rnaseq
for i in {E4,E10,E16,E17,E9,EMP1,M11,M1,M12,M3_1,M3_2,M6,M9,M10,M14,P12,P13,P14};
do
trim_galore -q 20 --phred33 --stringency 3 --length 20 -e 0.1 --paired ${i}_1.fq.gz ${i}_2.fq.gz --gzip -o ./clean -j 28 ;
done
################开始运行:2数据过滤################################
