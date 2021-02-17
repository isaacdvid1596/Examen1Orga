#!/bin/bash

EASYASM="EasyASM"
EXPECTED_OUTPUT="expected.txt"
OUTPUT_FILE=$(mktemp)
SRC_FILE="selection_sort.asm"

$EASYASM --run easm_crt.asm main.asm $SRC_FILE 
