# Lab 1: Secret-Key Encryption

## Task 5: Programming using the Crypto Library (Bonus Task)

## Instructions

1. **Compile the Code:**
   - Before compiling, ensure you have OpenSSL installed.
   - Update the Makefile with the correct paths to OpenSSL including library directories (if necessary).
   - Compile the code using the provided Makefile:
     ```bash
     make
     ```

2. **Run the Program:**
   - Make sure you have a wordlist file named "wordlist.txt" in the same directory as the executable.
   - Execute the program:
     ```bash
     ./enc
     ```

3. **Observations:**
   - The program will attempt different words from the wordlist as potential keys.
   - The progress will be displayed, showing the word being tried.
   - If a matching key is found, the program will print "Key found" and exit.

## Note:

- **Wordlist:**
  - Ensure the "wordlist.txt" file contains a list of English words, each word on a separate line.

- **File Length:**
  - If storing the plaintext message in a file, ensure the file length is exactly 21 characters, removing any special characters added by certain editors.

- **Compile Issues:**
  - If facing issues during compilation, double-check the OpenSSL paths in the Makefile.

- **Customization:**
  - You can modify the code to adapt it for different encryption algorithms or key lengths if needed.
