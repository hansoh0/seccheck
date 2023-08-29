#! /usr/bin/env bash

# Format wrapper for checksec
# Written by HanSoho

# Handle other errors
trap 'echo "Error: Something went wrong.";exit 1' ERR

# Make sure input is valid
if [ ! -f "$1" ]; then
    echo "Error: Input file '$1' does not exist or is not a valid file."
    exit 1
fi

# Define all variables
FFORMAT=$(objdump -f $1 | awk -F' ' '/file format/ {print $NF}')
CSEC=$(checksec --format=csv --file=$1)
IFS=','
read -a csv <<< "$CSEC"
descriptors=("RELRO" "STACK CANARY" "NX" "PIE" "RPATH" "RUNPATH" "Symbols" "FORTIFY" "Fortified" "Fortifiable" "FILE")

# Begin formatting and printing
echo -e "\n[ARCH]\t\t$FFORMAT"
for val in "${!csv[@]}"; do
	descriptor="${descriptors[$val]}"
	value="${csv[$val]}"
	if [ ${#descriptor} -gt 6 ]; then
		echo -e "[$descriptor]\t$value"
	else
		echo -e "[$descriptor]\t\t$value"
	fi
done
echo -en "\n"

