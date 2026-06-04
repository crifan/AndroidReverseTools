#!/bin/bash
# Function: Batch export so file symbols/functions
# Author: Crifan Li
# Usage:
#   batchExportElfInfo.sh <inputFolder_AllSoLibs> <outputFolder>
# Update: 20240824

# SEPERATOR="--------------------"
SEPERATOR="===================="

function log() {
  echo "${SEPERATOR} $1 ${SEPERATOR}"
}

function initOutputFolerFromInputFolder(){
  inputFolder=$1
  # echo "inputFolder=${inputFolder}"
  outputFoler=$2
  # echo "outputFoler=${outputFoler}"
  if [ -z "$outputFoler" ]
  then
    if [ -z "$inputFolder" ]
    then
      outputFoler="."
    else
      outputFoler=${inputFolder}
    fi
    # echo "outputFoler=${outputFoler}"
    echo ${outputFoler}
  else
    echo ${outputFoler}
  fi
}

inputFolder=$1
echo "inputFolder=${inputFolder}"
outputFoler=$2
echo "outputFoler=${outputFoler}"

outputFoler=$(initOutputFolerFromInputFolder $inputFolder $outputFoler)
echo "outputFoler=${outputFoler}"

soFileList=$(ls $inputFolder)
# soFileList=$(ls ${inputFolder})
# soFileList=`ls $inputFolder`
# soFileList=`ls ${inputFolder}`
# echo "soFileList=${soFileList}"
for eachSoFilename in $soFileList
do
  # eachFilename=$eachSoFilename[0,-3]
  # eachFilename=${eachSoFilename%???}
  eachFilename=${eachSoFilename%.*}
  # echo "eachFilename=${eachFilename}"
  # outputFilename="${eachFilename}_rabin2_E_exports.coffee"
  outputFilename="${eachFilename}_rabin2_l_libraries.coffee"
  inputFullFile=$inputFolder/$eachSoFilename
  outputFullFile=$outputFoler/$outputFilename
  echo "$eachSoFilename => $outputFullFile"
  # rabin2 -E $inputFullFile > $outputFullFile
  rabin2 -l $inputFullFile > $outputFullFile
done
