#!/bin/bash
# Function: Export/Extract single ELF file string and resources related info
# Author: Crifan Li
# Usage:
#   exportElf_StrResInfo.sh <inputSoLibFile.so> [<outputFolder>]
# Update: 20240824

# SEPERATOR="--------------------"
SEPERATOR="===================="

function log() {
  echo "${SEPERATOR} $1 ${SEPERATOR}"
}

function extractInputFolder(){
  curInputFile=$1
  # echo "curInputFile=${curInputFile}"
  retInputFolder="$(dirname "${curInputFile}")"
  # echo "retInputFolder=${retInputFolder}"
  # return retInputFolder
  # return $retInputFolder
  # echo ${retInputFolder}
  echo $retInputFolder
}

function extractFilenameNoSuffix(){
  curInputFile=$1
  # echo "curInputFile=${curInputFile}"
  filenameWithSuffix="$(basename "${inputFile}")"
  # echo "filenameWithSuffix=${filenameWithSuffix}"
  filenameNoSuffix=${filenameWithSuffix%.*}
  # echo "filenameNoSuffix=${filenameNoSuffix}"
  echo ${filenameNoSuffix}
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

inputFile=$1
echo "inputFile=${inputFile}"
outputFoler=$2
echo "outputFoler=${outputFoler}"

# inputFolder="$(dirname "${inputFile}")"
inputFolder=$(extractInputFolder $inputFile)
echo "inputFolder=${inputFolder}"

# elfFileWithSuffix="$(basename "${inputFile}")"
# echo "elfFileWithSuffix=${elfFileWithSuffix}"
# elfFile=${elfFileWithSuffix%.*}
# echo "elfFile=${elfFile}"
elfFile=$(extractFilenameNoSuffix $inputFile)
echo "elfFile=${elfFile}"

# if [ -z "$outputFoler" ]
# then
#   if [ -z "$inputFolder" ]
#   then
#     outputFoler="."
#   else
#     outputFoler=${inputFolder}
#   fi
#   echo "outputFoler=${outputFoler}"
# fi

outputFoler=$(initOutputFolerFromInputFolder $inputFolder $outputFoler)
echo "outputFoler=${outputFoler}"

log "Exporting info use rabin2"
rabin2 -I ${inputFile} > ${outputFoler}/${elfFile}_rabin2_I_identification.coffee
rabin2 -i ${inputFile} > ${outputFoler}/${elfFile}_rabin2_i_imports.coffee
rabin2 -E ${inputFile} > ${outputFoler}/${elfFile}_rabin2_E_exports.coffee
rabin2 -l ${inputFile} > ${outputFoler}/${elfFile}_rabin2_l_libraries.coffee
rabin2 -z ${inputFile} > ${outputFoler}/${elfFile}_rabin2_z_strings.coffee
rabin2 -s ${inputFile} > ${outputFoler}/${elfFile}_rabin2_s_symbols.coffee
rabin2 -S ${inputFile} > ${outputFoler}/${elfFile}_rabin2_S_sections.coffee

log "Exporting info use strings"
strings ${inputFile} > ${outputFoler}/${elfFile}_strings.coffee

log "Exporting info use readelf"
readelf -h ${inputFile} > ${outputFoler}/${elfFile}_readelf_h_header.coffee
readelf -a ${inputFile} > ${outputFoler}/${elfFile}_readelf_a_all.coffee
readelf -e ${inputFile} > ${outputFoler}/${elfFile}_readelf_e_hlS.coffee
readelf -s ${inputFile} > ${outputFoler}/${elfFile}_readelf_s_symbols.coffee
readelf -r ${inputFile} > ${outputFoler}/${elfFile}_readelf_r_relocs.coffee
readelf -l ${inputFile} > ${outputFoler}/${elfFile}_readelf_l_programHeaders_segments.coffee
readelf -S ${inputFile} > ${outputFoler}/${elfFile}_readelf_S_sections.coffee
readelf -x .dynsym ${inputFile} > ${outputFoler}/${elfFile}_readelf_x_hexDump_dynsym.coffee
readelf -p .dynsym ${inputFile} > ${outputFoler}/${elfFile}_readelf_p_stringDump_dynsym.coffee
readelf -p .dynstr ${inputFile} > ${outputFoler}/${elfFile}_readelf_p_stringDump_dynstr.coffee
readelf -n ${inputFile} > ${outputFoler}/${elfFile}_readelf_n_notes.coffee
readelf -d ${inputFile} > ${outputFoler}/${elfFile}_readelf_d_dynamic.coffee

log "Exporting info use objdump"
objdump -d -j .text ${inputFile} > ${outputFoler}/${elfFile}_objdump_d_j_disassembleSection_text.coffee
objdump -d -r ${inputFile} > ${outputFoler}/${elfFile}_objdump_d_r_disassemReloc.coffee
objdump -a ${inputFile} > ${outputFoler}/${elfFile}_objdump_a_archiveHeaders.coffee
objdump -f ${inputFile} > ${outputFoler}/${elfFile}_objdump_f_fileHeaders.coffee
objdump -h ${inputFile} > ${outputFoler}/${elfFile}_objdump_h_sectionHeaders.coffee
objdump -x ${inputFile} > ${outputFoler}/${elfFile}_objdump_x_allHeaders.coffee
objdump -s ${inputFile} > ${outputFoler}/${elfFile}_objdump_s_fullContents.coffee
objdump -t ${inputFile} > ${outputFoler}/${elfFile}_objdump_t_syms.coffee
objdump -T ${inputFile} > ${outputFoler}/${elfFile}_objdump_T_dynamicSyms.coffee
objdump -r ${inputFile} > ${outputFoler}/${elfFile}_objdump_r_reloc.coffee
objdump -R ${inputFile} > ${outputFoler}/${elfFile}_objdump_R_dynamicReloc.coffee

log "Exporting info Done"
