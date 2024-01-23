#!/bin/bash

# Function to flip a single bit at a specific position in a file
flip_single_bit() {
    file=$1
    position=$2
    dd if=$file of=$file bs=1 seek=$position count=1 conv=notrunc
}

# Specify the path to the plaintext file and the position of the bit to flip
plaintext_file="plaintext.txt"
bit_position=42  # Change this to the desired bit position

# AES-128-ECB
# Encrypting
openssl enc -aes-128-ecb -e -in $plaintext_file -out encrypted_aes128ecb.txt -K 001122334455

# Flip a Single Bit in the Plaintext
flip_single_bit $plaintext_file $bit_position

# Re-Encrypting with the Modified Plaintext
openssl enc -aes-128-ecb -e -in $plaintext_file -out modified_encrypted_aes128ecb.txt -K 001122334455

# Decrypting Modified File
openssl enc -aes-128-ecb -d -in modified_encrypted_aes128ecb.txt -out decrypted_modified_aes128ecb.txt -K 001122334455

# AES-128-CBC
# Encrypting
openssl enc -aes-128-cbc -e -in $plaintext_file -out encrypted_aes128cbc.txt -K 001122334455 -iv 001002003004005

# Flip a Single Bit in the Plaintext
flip_single_bit $plaintext_file $bit_position

# Re-Encrypting with the Modified Plaintext
openssl enc -aes-128-cbc -e -in $plaintext_file -out modified_encrypted_aes128cbc.txt -K 001122334455 -iv 001002003004005

# Decrypting Modified File
openssl enc -aes-128-cbc -d -in modified_encrypted_aes128cbc.txt -out decrypted_modified_aes128cbc.txt -K 001122334455 -iv 001002003004005

# AES-128-CFB
# Encrypting
openssl enc -aes-128-cfb -e -in $plaintext_file -out encrypted_aes128cfb.txt -K 001122334455 -iv 001002003004005

# Flip a Single Bit in the Plaintext
flip_single_bit $plaintext_file $bit_position

# Re-Encrypting with the Modified Plaintext
openssl enc -aes-128-cfb -e -in $plaintext_file -out modified_encrypted_aes128cfb.txt -K 001122334455 -iv 001002003004005

# Decrypting Modified File
openssl enc -aes-128-cfb -d -in modified_encrypted_aes128cfb.txt -out decrypted_modified_aes128cfb.txt -K 001122334455 -iv 001002003004005

# AES-128-OFB
# Encrypting
openssl enc -aes-128-ofb -e -in $plaintext_file -out encrypted_aes128ofb.txt -K 001122334455 -iv 001002003004005

# Flip a Single Bit in the Plaintext
flip_single_bit $plaintext_file $bit_position

# Re-Encrypting with the Modified Plaintext
openssl enc -aes-128-ofb -e -in $plaintext_file -out modified_encrypted_aes128ofb.txt -K 001122334455 -iv 001002003004005

# Decrypting Modified File
openssl enc -aes-128-ofb -d -in modified_encrypted_aes128ofb.txt -out decrypted_modified_aes128ofb.txt -K 001122334455 -iv 001002003004005

# Clean up
rm modified_encrypted_aes128ecb.txt modified_encrypted_aes128cbc.txt modified_encrypted_aes128cfb.txt modified_encrypted_aes128ofb.txt
