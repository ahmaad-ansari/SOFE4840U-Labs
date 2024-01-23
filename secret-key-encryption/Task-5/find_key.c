#include <stdio.h>
#include <string.h>
#include <openssl/evp.h>

#define MAX_KEY_LENGTH 16
#define CIPHERTEXT_HEX "8d20e5056a8d24d0462ce74e4904clb5"
#define PLAINTEXT "This is a top secret."

int main() {
    EVP_CIPHER_CTX *ctx;
    const unsigned char *ciphertext_hex = CIPHERTEXT_HEX;
    const unsigned char *plaintext = PLAINTEXT;
    unsigned char key[MAX_KEY_LENGTH];
    unsigned char decrypted_text[1024];  // Assuming a maximum length for decrypted text

    // Initialize OpenSSL library
    OpenSSL_add_all_algorithms();
    ERR_load_crypto_strings();

    // Dictionary file containing English words, one word per line
    FILE *wordlist = fopen("wordlist.txt", "r");
    if (!wordlist) {
        fprintf(stderr, "Error: Could not open wordlist.txt\n");
        return 1;
    }

    // Create and initialize the cipher context
    ctx = EVP_CIPHER_CTX_new();

    // Iterate through each word in the wordlist
    while (fgets(key, MAX_KEY_LENGTH, wordlist) != NULL) {
        // Remove newline character from the key
        key[strcspn(key, "\n")] = 0;

        // Append space characters to the key to form a 128-bit key
        while (strlen(key) < 16) {
            strcat(key, " ");
        }

        // Decrypt the ciphertext using the current key
        EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, NULL);
        EVP_DecryptUpdate(ctx, decrypted_text, NULL, ciphertext_hex, strlen((char *)ciphertext_hex));
        EVP_DecryptFinal_ex(ctx, decrypted_text + strlen((char *)decrypted_text), NULL);

        // Check if the decrypted text matches the plaintext
        if (strcmp((char *)decrypted_text, plaintext) == 0) {
            printf("Key found: %s\n", key);
            break;
        }
    }

    // Clean up
    EVP_CIPHER_CTX_free(ctx);
    fclose(wordlist);

    return 0;
}
