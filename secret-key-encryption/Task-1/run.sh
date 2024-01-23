#!/bin/bash

# Encrypting with AES-128-CBC
openssl enc -aes-128-cbc -e -in plaintext.txt -out ciphertext_aes128cbc.txt -K 0123456789abcd -iv 0102030405

# Encrypting with AES-128-CFB
openssl enc -aes-128-cfb -e -in plaintext.txt -out ciphertext_aes128cfb.txt -K 0123456789abcd -iv 0102030405

# Encrypting with AES-192-GCM
openssl enc -aes-192-gcm -e -in plaintext.txt -out ciphertext_aes192gcm.txt -K 0123456789abcd -iv 0102030405

# Encrypting with DES-EDE3-CFB1
openssl enc -des-ede3-cfb1 -e -in plaintext.txt -out ciphertext_desede3cfb1.txt -K 0123456789abcd -iv 0102030405
