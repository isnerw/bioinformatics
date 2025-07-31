#!/bin/bash
#$ -S /bin/bash
#$ -pe serial 16
#$ -l mfree=10G
#$ -l h_rt=99:00:00
#$ -cwd

module load modules; module load modules-init; module load modules-gs; module load bcl2fastq/2.20 ##cluster module 

dir=/net/fields/vol2/fieldslab-inst/nextseq/Output/250619_VH00123_629_AACVV7GHV

out=/net/hawkins/vol1/home/aisner/ 

sheet=/net/hawkins/vol1/home/aisner/SampleSheet_pC3_T51.csv 

bcl2fastq -R $dir \
         --use-bases-mask y51,i8,i8,y51 \
         --barcode-mismatches 1 \
          -o $out \
         --sample-sheet $sheet


##change parameters
# --use-bases-mask: if you need to masked the i5 (in case you only have i7)
#--use-bases-mask Y51,I8,I8,Y51

##not allow mismatches
#--barcode-mismatches 1
