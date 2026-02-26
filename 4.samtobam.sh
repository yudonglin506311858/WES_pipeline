
################开始运行:4.sam文件转换为bam文件################################
ulimit -n 655350
cd /data9/yudonglin/zyy/WES
mkdir bwa
conda activate rnaseq
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
for i in {E4,E10,E16,E17,E9,EMP1,M11,M1,M12,M3_1,M3_2,M6,M9,M10,M14,P12,P13,P14};
do
    echo "Processing ${i}..."
    
    # 1. 直接排序SAM文件为BAM（多线程）
   samtools sort -@ 60 -o ./bwa/${i}_trimmed.sorted.bam ./bwa/${i}_trimmed.sam ;
    rm ./bwa/${i}_trimmed.sam ;
    # 2. 添加Read Groups（使用文件输入）
    java -Xmx60g -jar /data/yudonglin/software/picard/build/libs/picard.jar \
        AddOrReplaceReadGroups \
        I=./bwa/${i}_trimmed.sorted.bam \
        O=./bwa/${i}_trimmed.rg.sorted.bam \
        SORT_ORDER=coordinate \
        CREATE_INDEX=true \
        RGID=${i} \
        RGLB="pe" \
        RGPU="HiSeq-2000" \
        RGSM=${i} \
        RGCN="Human Genetics of Infectious Disease" \
        RGDS=hg19 \
        RGPL=illumina \
        VALIDATION_STRINGENCY=SILENT > ./bwa/${i}_trimmed.AddOrReplaceReadGroups.log 2>&1 ;
    rm ./bwa/${i}_trimmed.sorted.bam
    echo "Completed: ${i}"
done

echo "All samples processed!"

################开始运行:4.sam文件转换为bam文件################################
