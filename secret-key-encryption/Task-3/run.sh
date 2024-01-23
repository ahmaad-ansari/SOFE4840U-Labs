#!/bin/bash

# Specify the path to the plaintext file
plaintext_file="plaintext.txt"

# AES-128-ECB
# Encrypting
openssl enc -aes-128-ecb -e -in $plaintext_file -out encrypted_aes128ecb.txt -K 001122334455

# AES-128-CBC
# Encrypting
openssl enc -aes-128-cbc -e -in $plaintext_file -out encrypted_aes128cbc.txt -K 001122334455 -iv 001002003004005

# AES-128-CFB
# Encrypting
openssl enc -aes-128-cfb -e -in $plaintext_file -out encrypted_aes128cfb.txt -K 001122334455 -iv 001002003004005

# AES-128-OFB
# Encrypting
openssl enc -aes-128-ofb -e -in $plaintext_file -out encrypted_aes128ofb.txt -K 001122334455 -iv 001002003004005
