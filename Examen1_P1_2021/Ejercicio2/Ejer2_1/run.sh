#!/bin/bash

EASYASM="EasyASM"
SRC_FILE="insertion_sort.asm"

$EASYASM --run easm_crt.asm main.asm $SRC_FILE
