
# Lab 1: Secret-Key Encryption

## Task 3: Encryption Mode – Corrupted Cipher Text

1. **Encrypting using AES-128-CBC:**
   ```bash
   openssl enc -aes-128-cbc -e -in plaintext.txt -out encrypted_aes128cbc.txt -K 001122334455 -iv 001002003004005
   ```

2. **Corrupting a Single Bit:**
   - Use a hex editor to change a single bit in the `encrypted_aes128cbc.txt` file.

3. **Decrypting Corrupted File:**
   ```bash
   openssl enc -aes-128-cbc -d -in corrupted_aes128cbc.txt -out decrypted_corrupted_aes128cbc.txt -K 001122334455 -iv 001002003004005
   ```

### AES-128-ECB:
#### Encrypting:
```bash
openssl enc -aes-128-ecb -e -in plaintext.txt -out encrypted_aes128ecb.txt -K 001122334455
```
#### Corrupting a Single Bit:
- Use a hex editor to change a single bit in the `encrypted_aes128ecb.txt` file.

#### Decrypting Corrupted File:
```bash
openssl enc -aes-128-ecb -d -in corrupted_aes128ecb.txt -out decrypted_corrupted_aes128ecb.txt -K 001122334455
```

### AES-128-CBC:
#### Encrypting:
```bash
openssl enc -aes-128-cbc -e -in plaintext.txt -out encrypted_aes128cbc.txt -K 001122334455 -iv 001002003004005
```
#### Corrupting a Single Bit:
- Use a hex editor to change a single bit in the `encrypted_aes128cbc.txt` file.

#### Decrypting Corrupted File:
```bash
openssl enc -aes-128-cbc -d -in corrupted_aes128cbc.txt -out decrypted_corrupted_aes128cbc.txt -K 001122334455 -iv 001002003004005
```

### AES-128-CFB:
#### Encrypting:
```bash
openssl enc -aes-128-cfb -e -in plaintext.txt -out encrypted_aes128cfb.txt -K 001122334455 -iv 001002003004005
```
#### Corrupting a Single Bit:
- Use a hex editor to change a single bit in the `encrypted_aes128cfb.txt` file.

#### Decrypting Corrupted File:
```bash
openssl enc -aes-128-cfb -d -in corrupted_aes128cfb.txt -out decrypted_corrupted_aes128cfb.txt -K 001122334455 -iv 001002003004005
```

### AES-128-OFB:
#### Encrypting:
```bash
openssl enc -aes-128-ofb -e -in plaintext.txt -out encrypted_aes128ofb.txt -K 001122334455 -iv 001002003004005
```
#### Corrupting a Single Bit:
- Use a hex editor to change a single bit in the `encrypted_aes128ofb.txt` file.

#### Decrypting Corrupted File:
```bash
openssl enc -aes-128-ofb -d -in corrupted_aes128ofb.txt -out decrypted_corrupted_aes128ofb.txt -K 001122334455 -iv 001002003004005
```

## Answers to Questions:

(1) **How much information can you recover by decrypting the corrupted file, if the encryption mode is ECB, CBC, CFB, or OFB, respectively?**

- **ECB:** You can recover information only in the corrupted block.
- **CBC:** You can recover information only in the corrupted block and lose information in subsequent blocks.
- **CFB:** You can recover information only in the corrupted bit and lose information in subsequent bits.
- **OFB:** You can recover information only in the corrupted block and lose information in subsequent blocks.

(2) **Please explain why.**

- **ECB:** Each block is independent, so the corruption is confined to that block.
- **CBC:** The XOR chaining means corruption affects the current block and all subsequent blocks.
- **CFB:** The corruption affects only the corresponding bit in subsequent blocks.
- **OFB:** Similar to CFB, the corruption is confined to the current block.

(3) **What is the implication of these differences?**

- **ECB:** Limited impact, as only the corrupted block is affected.
- **CBC:** Greater impact, as corruption propagates through subsequent blocks.
- **CFB:** Limited impact, affecting only the corresponding bit in subsequent blocks.
- **OFB:** Limited impact, as corruption is confined to the current block.

## Note:
- Replace `plaintext.txt` with the actual path to your text file.
- Adjust the output file names accordingly.
- Use a hex editor to manipulate a single bit as instructed in Task 3.
- The initialization vector (`-iv`) is used for CBC, CFB, and OFB modes. Make sure to adjust it if needed.
- These commands assume the use of AES-128. If you need a different key size, you can adjust the command accordingly (e.g., `aes-256-ecb` for AES-256).
