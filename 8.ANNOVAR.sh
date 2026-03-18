#https://www.openbioinformatics.org/annovar/annovar_download_form.php
#自己注册
cd /data/yudonglin/software/
wget http://www.openbioinformatics.org/annovar/download/0wgxR2rIVP/annovar.latest.tar.gz
tar -zxvf annovar.latest.tar.gz

perl /data/yudonglin/software/annovar/table_annovar.pl
cd /data/yudonglin/software/annovar
perl /data/yudonglin/software/annovar/annotate_variation.pl -buildver hg19 -downdb refGene humandb/
perl /data/yudonglin/software/annovar/annotate_variation.pl -buildver hg19 -downdb gnomad211_exome humandb/
perl /data/yudonglin/software/annovar/annotate_variation.pl -buildver hg19 -downdb clinvar_20220320 humandb/


wget http://www.openbioinformatics.org/annovar/download/hg19_gnomad211_exome.txt.gz
wget http://www.openbioinformatics.org/annovar/download/hg19_clinvar_20220320.txt.gz



perl /data/yudonglin/software/annovar/table_annovar.pl \
filtered.vcf /data/yudonglin/software/annovar/humandb/ \
-buildver hg19 \
-out anno \
-remove \
-protocol refGene,gnomad211_exome,clinvar_20220320 \
-operation g,f,f \
-nastring . \
-vcfinput \
-thread 20

#############从 VCF 重新构建 MAF#############
for s in *gatk.vcf; do
    perl /data/yudonglin/software/annovar/table_annovar.pl $s /data/yudonglin/software/annovar/humandb/ \
    -buildver hg19 \
    -out ${s%.vcf} \
    -remove \
    -protocol refGene,gnomad211_exome,clinvar_20220320 \
    -operation g,f,f \
    -nastring . \
    -vcfinput -thread 20
done


