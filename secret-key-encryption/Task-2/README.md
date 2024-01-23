
# Lab 1: Secret-Key Encryption

## Task 2: Encryption Mode – ECB vs. CBC

### Encrypting using AES-256-ECB:
```bash
openssl enc -aes-256-ecb -e -in pic.bmp -out aes_256_ecb_encrypted.bmp -K 001122334455
```

### Encrypting using AES-256-CBC:
```bash
openssl enc -aes-256-cbc -e -in pic.bmp -out aes_256_cbc_encrypted.bmp -K 001122334455 -iv 001002003004005
```

### Replacing Header using dd command:
For AES-256-ECB:
```bash
dd if=pic.bmp of=aes_256_ecb_encrypted.bmp bs=54 count=1 conv=notrunc
```

For AES-256-CBC:
```bash
dd if=pic.bmp of=aes_256_cbc_encrypted.bmp bs=54 count=1 conv=notrunc
```

### Observation:

1. **AES-256-ECB:**
   - ECB mode doesn't use an initialization vector (IV).
   - Each block is encrypted independently.
   - Replacing the header allows the file to be opened as a BMP file, but patterns in the original picture might still be recognizable.

2. **AES-256-CBC:**
   - CBC mode uses an IV and involves chaining blocks.
   - The header replacement makes the encrypted file appear as a valid BMP file.
   - The chaining effect in CBC provides better security against pattern recognition compared to ECB.

## Note:
- Adjust file paths and names according to your actual setup.
- Use a hex editor or the provided `dd` commands to replace the headers.
- Open the encrypted pictures in a viewer to observe any patterns or information leakage from the original picture.
