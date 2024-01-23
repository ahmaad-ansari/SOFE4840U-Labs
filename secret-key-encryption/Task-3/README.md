
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
- Adjust file paths and names according to your actual setup.
- The hex editor tool allows you to manipulate individual bits or bytes in the file.
- Observations might vary based on the specific bit or byte corrupted.
