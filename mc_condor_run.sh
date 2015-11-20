#!/bin/bash

tar -xvf run_MC.tar > /dev/null

export SCRAM_ARCH=slc6_amd64_gcc491
source /osg/app/cmssoft/cms/cmsset_default.sh

echo ""
echo "----------------------------------------------------"
echo "Job started on `date` at WN: `hostname` "
echo "Job is running on `uname -a`"

df -h

gcc --version

startfile=$1
endfile=$2
radius=$3
coll=$4
run=$5
jetType=$6
algo=$7
outfile=$8
echo "Processing..."

root -b -l <<EOF
.x Validate_Jets.C+($startfile,$endfile,$radius,"$coll", "$run", "$jetType", "$algo","$outfile")
.q
EOF

mv $outputfile /mnt/hadoop/cms/store/user/rkunnawa/Run2/PromptForest_checks/.


echo "Done!"

echo "Copied output files to hadoop rkunnawa/Run2/JESJER_checks/" 
