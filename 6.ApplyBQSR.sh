
################开始运行:6. BQSR 校正（BaseRecalibrator）和 应用 BQSR（ApplyBQSR）################################
ulimit -n 655350
cd /data9/yudonglin/zyy/WES
mkdir bam
conda activate /home/yudonglin/miniconda3/envs/WGS
for i in {E4,E10,E16,E17,E9,EMP1,M11,M1,M12,M3_1,M3_2,M6,M9,M10,M14,P12,P13,P14};
do
/data/yudonglin/software/gatk-4.5.0.0/gatk \
BaseRecalibrator \
-R /data/yudonglin/reference/human/hg19/bwa/hg19.fa \
-I ./bwa/${i}_trimmed.dedup.bam \
--known-sites /data/yudonglin/reference/gatk/hg19/dbsnp_138.hg19.vcf \
--known-sites /data/yudonglin/reference/gatk/hg19/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf \
-O ./bam/${i}.recal.table \
2>>${i}.bqsr1.log 
done

for i in {E4,E10,E16,E17,E9,EMP1,M11,M1,M12,M3_1,M3_2,M6,M9,M10,M14,P12,P13,P14};
do
/data/yudonglin/software/gatk-4.5.0.0/gatk \
ApplyBQSR \
-R  /data/yudonglin/reference/human/hg19/bwa/hg19.fa \
-I  ./bwa/${i}_trimmed.dedup.bam \
--bqsr-recal-file ./bam/${i}.recal.table \
-O bam/${i}.recal.bam ;
done
################开始运行:6. BQSR 校正（BaseRecalibrator）和 应用 BQSR（ApplyBQSR）################################
