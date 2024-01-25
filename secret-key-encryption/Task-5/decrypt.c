#include <openssl/evp.h>
#include <openssl/err.h>
#include <string.h>
#include <stdio.h>

void handleErrors(void) {
    ERR_print_errors_fp(stderr);
    abort();
}

void print_hex(const char *label, const unsigned char *data, int len) {
    printf("%s:", label);
    for (int i = 0; i < len; i++) {
        printf("%02x", data[i]);
    }
    printf("\n");
}

int encrypt_and_compare(const char *plaintext, int plaintext_len, const unsigned char *key, const unsigned char *iv, const unsigned char *ciphertext, int ciphertext_len) {
    EVP_CIPHER_CTX *ctx;
    int len;
    unsigned char encrypted[128];

    if(!(ctx = EVP_CIPHER_CTX_new())) handleErrors();

    if(1 != EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv))
        handleErrors();

    if(1 != EVP_EncryptUpdate(ctx, encrypted, &len, plaintext, plaintext_len))
        handleErrors();

    if(1 != EVP_EncryptFinal_ex(ctx, encrypted + len, &len)) handleErrors();
    len += len;

    EVP_CIPHER_CTX_free(ctx);

    print_hex("Encrypted with key", encrypted, ciphertext_len);
    return (len == ciphertext_len && memcmp(encrypted, ciphertext, ciphertext_len) == 0);
}

void hexStringToByteArray(const char *hexString, unsigned char *byteArray, int byteArrayLength) {
    for (int i = 0; i < byteArrayLength; i++) {
        sscanf(hexString + 2*i, "%2hhx", &byteArray[i]);
    }
}

int main() {
    unsigned char *plaintext = (unsigned char *)"This is a top secret.";
    const char *hexCiphertext = "06ba8865595ca93864c6fecadcf7157470ffae70a0c0647708bd7688b75d1f21";
    unsigned char ciphertext[32];
    hexStringToByteArray(hexCiphertext, ciphertext, sizeof(ciphertext));
    unsigned char iv[16] = {0};

    FILE *file;
    char word[17];
    int found = 0;

    file = fopen("dictionary.txt", "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    printf("Starting Decryption...\n");
    print_hex("Ciphertext for comparison", ciphertext, sizeof(ciphertext));
    print_hex("IV", iv, 16);

    while (fscanf(file, "%16s", word) != EOF) {
        int word_len = strlen(word);
        while (word_len < 16) word[word_len++] = ' '; // Padding with space
        word[16] = '\0'; // Ensure null-termination

        printf("Trying key: %s\n", word);

        if (encrypt_and_compare(plaintext, strlen((char *)plaintext), (unsigned char *)word, iv, ciphertext, sizeof(ciphertext))) {
            printf("Key found: %s\n", word);
            found = 1;
            break;
        }
    }

    fclose(file);

    if (!found) {
        printf("Key not found.\n");
    }

    return 0;
}
