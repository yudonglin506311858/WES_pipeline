
################开始运行:7.  GATK 变异检测（HaplotypeCaller，推荐） ################################
ulimit -n 655350
cd /data9/yudonglin/zyy/WES
mkdir bam
conda activate /home/yudonglin/miniconda3/envs/WGS
for i in {E4,E10,E16,E17,E9,EMP1,M11,M1,M12,M3_1,M3_2,M6,M9,M10,M14,P12,P13,P14};
do
/data/yudonglin/software/gatk-4.5.0.0/gatk  HaplotypeCaller \
-R  /data/yudonglin/reference/human/hg19/bwa/hg19.fa  \
-I ./bam/${i}.recal.bam \
-O ./vcf/${i}.gatk.vcf \
--native-pair-hmm-threads 50
done
################开始运行:7.  GATK 变异检测（HaplotypeCaller，推荐） ################################
