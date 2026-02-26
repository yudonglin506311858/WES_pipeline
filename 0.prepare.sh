
################准备软件################################
# 1. 下载GATK 4.5.0.0（稳定版本）
cd /data/yudonglin/software
wget https://github.com/broadinstitute/gatk/releases/download/4.5.0.0/gatk-4.5.0.0.zip
# 2. 解压
unzip gatk-4.5.0.0.zip
# 3. 测试
conda activate /home/yudonglin/miniconda3/envs/WGS
#mamba install -n rnaseq -c conda-forge openjdk=17
java -version
which java
/data/yudonglin/software/gatk-4.5.0.0/gatk --list
################准备软件################################

################准备文件################################

cd /data/yudonglin/reference/gatk/hg19/
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/dbsnp_138.hg19.vcf.gz
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf.gz

conda activate /home/yudonglin/miniconda3/envs/WGS
#mamba install -n rnaseq -c conda-forge openjdk=17
java -version
which java

/data/yudonglin/software/gatk-4.5.0.0/gatk IndexFeatureFile \
    -I /data/yudonglin/reference/gatk/hg19/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf

/data/yudonglin/software/gatk-4.5.0.0/gatk IndexFeatureFile \
    -I /data/yudonglin/reference/gatk/hg19/dbsnp_138.hg19.vcf

cd /data/yudonglin/reference/human/hg19/bwa/
/data/yudonglin/software/gatk-4.5.0.0/gatk CreateSequenceDictionary -R /data/yudonglin/reference/human/hg19/bwa/hg19.fa  -O hg19.dict

#https://gatk.broadinstitute.org/hc/en-us/articles/360036194592-Getting-started-with-GATK4

################准备文件################################
