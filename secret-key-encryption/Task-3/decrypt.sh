#!/bin/bash

# Specify the paths to the corrupted files
corrupted_aes128ecb_file="corrupted_aes128ecb.txt"
corrupted_aes128cbc_file="corrupted_aes128cbc.txt"
corrupted_aes128cfb_file="corrupted_aes128cfb.txt"
corrupted_aes128ofb_file="corrupted_aes128ofb.txt"

# Specify the paths for the decrypted output
decrypted_aes128ecb_file="decrypted_corrupted_aes128ecb.txt"
decrypted_aes128cbc_file="decrypted_corrupted_aes128cbc.txt"
decrypted_aes128cfb_file="decrypted_corrupted_aes128cfb.txt"
decrypted_aes128ofb_file="decrypted_corrupted_aes128ofb.txt"

# AES-128-ECB
# Decrypting
openssl enc -aes-128-ecb -d -in $corrupted_aes128ecb_file -out $decrypted_aes128ecb_file -K 001122334455

# AES-128-CBC
# Decrypting
openssl enc -aes-128-cbc -d -in $corrupted_aes128cbc_file -out $decrypted_aes128cbc_file -K 001122334455 -iv 001002003004005

# AES-128-CFB
# Decrypting
openssl enc -aes-128-cfb -d -in $corrupted_aes128cfb_file -out $decrypted_aes128cfb_file -K 001122334455 -iv 001002003004005

# AES-128-OFB
# Decrypting
openssl enc -aes-128-ofb -d -in $corrupted_aes128ofb_file -out $decrypted_aes128ofb_file -K 001122334455 -iv 001002003004005
