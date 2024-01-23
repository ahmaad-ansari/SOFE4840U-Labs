#!/bin/bash

# Encrypting using AES-256-ECB
openssl enc -aes-256-ecb -e -in pic.bmp -out aes_256_ecb_encrypted.bmp -K 001122334455

# Encrypting using AES-256-CBC
openssl enc -aes-256-cbc -e -in pic.bmp -out aes_256_cbc_encrypted.bmp -K 001122334455 -iv 001002003004005

# Replacing Header using dd command for AES-256-ECB
dd if=pic.bmp of=aes_256_ecb_encrypted.bmp bs=54 count=1 conv=notrunc

# Replacing Header using dd command for AES-256-CBC
dd if=pic.bmp of=aes_256_cbc_encrypted.bmp bs=54 count=1 conv=notrunc
