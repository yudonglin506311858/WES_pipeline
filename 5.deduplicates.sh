
################开始运行:5.去除重复################################
ulimit -n 655350
cd /data9/yudonglin/zyy/WES
mkdir bwa
conda activate rnaseq
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
for i in {E4,E10,E16,E17,E9,EMP1,M11,M1,M12,M3_1,M3_2,M6,M9,M10,M14,P12,P13,P14};
do
    echo "Processing ${i}..."
    java -Xmx60g -jar /data/yudonglin/software/picard/build/libs/picard.jar \
        MarkDuplicates \
        CREATE_INDEX=true \
        REMOVE_DUPLICATES=true \
        ASSUME_SORTED=true \
        VALIDATION_STRINGENCY=LENIENT \
        I="./bwa/${i}_trimmed.rg.sorted.bam" \
        OUTPUT="./bwa/${i}_trimmed.dedup.bam" \
        METRICS_FILE="${i}_dedup.metrics" \
        1>>"${i}_MarkDuplicates.log" 2>&1
    echo "Completed: ${i}"
done
################开始运行:5.去除重复################################
