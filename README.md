# WES_pipeline
WES分析代码

全外显子测序（WES）仅针对基因组中外显子区域（约占全基因组的1-2%），即能够编码蛋白质的部分进行测序。能有效检测与疾病相关的编码变异（如单核苷酸变异和小片段插入/缺失）。对非编码区变异无检测能力，无法全面解析调控区变异或结构变异。
我们使用 FastQC 和 MultiQC 对原始数据进行质控。使用trim_galore过滤数据。然后使用 BWA 将测序数据比对到参考基因组hg19，使用samtools将 SAM 文件转换为 BAM 文件，排序，并使用picard去除重复。使用 GATK HaplotypeCaller 检测变异。
