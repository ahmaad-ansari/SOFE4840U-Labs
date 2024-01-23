# Lab 1: Secret-Key Encryption

## Task 1: Encryption using different ciphers and modes

### Encrypting with AES-128-CBC:
```bash
openssl enc -aes-128-cbc -e -in plaintext.txt -out ciphertext_aes128cbc.txt -K 0123456789abcd -iv 0102030405
```

### Encrypting with AES-128-CFB:
```bash
openssl enc -aes-128-cfb -e -in plaintext.txt -out ciphertext_aes128cfb.txt -K 0123456789abcd -iv 0102030405
```

### Encrypting with AES-192-GCM:
```bash
openssl enc -aes-192-gcm -e -in plaintext.txt -out ciphertext_aes192gcm.txt -K 0123456789abcd -iv 0102030405
```

### Encrypting with DES-EDE3-CFB1:
```bash
openssl enc -des-ede3-cfb1 -e -in plaintext.txt -out ciphertext_desede3cfb1.txt -K 0123456789abcd -iv 0102030405
```

## Observation:

- **AES-128-CBC:**
  - Cipher: AES with 128-bit key in CBC mode.
  - Commonly used for symmetric key encryption.
  - Requires an initialization vector (IV) for added security.

- **AES-128-CFB:**
  - Cipher: AES with 128-bit key in CFB mode.
  - Cipher Feedback (CFB) mode, which operates on units smaller than a block.

- **AES-192-GCM:**
  - Cipher: AES with 192-bit key in GCM mode.
  - GCM provides authenticated encryption and is an AEAD (Authenticated Encryption with Associated Data) mode.

- **DES-EDE3-CFB1:**
  - Cipher: Triple DES (3DES) in CFB mode with a feedback size of 1 bit.
  - 3DES applies the DES cipher algorithm three times to each data block.

## Note:
- Replace `plaintext.txt` with the actual path to your text file.
- Adjust the output file names accordingly.
