#!/bin/bash

# Function to flip a single bit in a hex string
flip_single_bit() {
    hex_string=$1
    bit_position=$2
    flipped_hex=$(echo $hex_string | awk -v pos=$bit_position '{printf("%02x", ("0x" $1) ^ (1 << pos))}')
    echo $flipped_hex
}

# AES-128-ECB
# Encrypting
openssl enc -aes-128-ecb -e -in plaintext.txt -out encrypted_aes128ecb.txt -K 001122334455

# Corrupting a Single Bit
hex_string=$(xxd -p -l 16 encrypted_aes128ecb.txt)
flipped_hex=$(flip_single_bit $hex_string 0)
echo $flipped_hex | xxd -r -p > corrupted_aes128ecb.txt

# Decrypting Corrupted File
openssl enc -aes-128-ecb -d -in corrupted_aes128ecb.txt -out decrypted_corrupted_aes128ecb.txt -K 001122334455

# AES-128-CBC
# Encrypting
openssl enc -aes-128-cbc -e -in plaintext.txt -out encrypted_aes128cbc.txt -K 001122334455 -iv 001002003004005

# Corrupting a Single Bit
hex_string=$(xxd -p -l 16 encrypted_aes128cbc.txt)
flipped_hex=$(flip_single_bit $hex_string 0)
echo $flipped_hex | xxd -r -p > corrupted_aes128cbc.txt

# Decrypting Corrupted File
openssl enc -aes-128-cbc -d -in corrupted_aes128cbc.txt -out decrypted_corrupted_aes128cbc.txt -K 001122334455 -iv 001002003004005

# AES-128-CFB
# Encrypting
openssl enc -aes-128-cfb -e -in plaintext.txt -out encrypted_aes128cfb.txt -K 001122334455 -iv 001002003004005

# Corrupting a Single Bit
hex_string=$(xxd -p -l 16 encrypted_aes128cfb.txt)
flipped_hex=$(flip_single_bit $hex_string 0)
echo $flipped_hex | xxd -r -p > corrupted_aes128cfb.txt

# Decrypting Corrupted File
openssl enc -aes-128-cfb -d -in corrupted_aes128cfb.txt -out decrypted_corrupted_aes128cfb.txt -K 001122334455 -iv 001002003004005

# AES-128-OFB
# Encrypting
openssl enc -aes-128-ofb -e -in plaintext.txt -out encrypted_aes128ofb.txt -K 001122334455 -iv 001002003004005

# Corrupting a Single Bit
hex_string=$(xxd -p -l 16 encrypted_aes128ofb.txt)
flipped_hex=$(flip_single_bit $hex_string 0)
echo $flipped_hex | xxd -r -p > corrupted_aes128ofb.txt

# Decrypting Corrupted File
openssl enc -aes-128-ofb -d -in corrupted_aes128ofb.txt -out decrypted_corrupted_aes128ofb.txt -K 001122334455 -iv 001002003004005

# Clean up
rm corrupted_aes128ecb.txt corrupted_aes128cbc.txt corrupted_aes128cfb.txt corrupted_aes128ofb.txt
