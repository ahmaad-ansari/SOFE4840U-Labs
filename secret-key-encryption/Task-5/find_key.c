#include <openssl/evp.h>
#include <openssl/err.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define KEY_LENGTH 16
#define BLOCK_SIZE 16
#define PLAINTEXT "This is a top secret."
#define CIPHERTEXT "\x8d\x20\xe5\x05\x6a\x8d\x24\xd0\x46\x2c\xe7\x4e\x49\x04\xcl\xb5\x13\xe1\x0d\x1d\xf4\xa2\xef\x2a\xd4\x54\x0f\xae\x1c\xa0\xaa\xf9"

void handleErrors(void) {
    ERR_print_errors_fp(stderr);
    abort();
}

int encrypt(const unsigned char *plaintext, int plaintext_len, const unsigned char *key,
            const unsigned char *iv, unsigned char *ciphertext) {
    EVP_CIPHER_CTX *ctx;
    int len;
    int ciphertext_len;

    if (!(ctx = EVP_CIPHER_CTX_new())) {
        handleErrors();
    }

    if (!EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv)) {
        handleErrors();
    }

    if (!EVP_EncryptUpdate(ctx, ciphertext, &len, plaintext, plaintext_len)) {
        handleErrors();
    }
    ciphertext_len = len;

    if (!EVP_EncryptFinal_ex(ctx, ciphertext + len, &len)) {
        handleErrors();
    }
    ciphertext_len += len;

    EVP_CIPHER_CTX_free(ctx);

    return ciphertext_len;
}

int main() {
    FILE *file = fopen("wordlist.txt", "r");
    if (!file) {
        fprintf(stderr, "Cannot open wordlist.txt\n");
        return 1;
    }

    char word[17];
    unsigned char ciphertext[BLOCK_SIZE * 2];
    const unsigned char iv[KEY_LENGTH] = {0};
    unsigned char key[KEY_LENGTH];
    int ciphertext_len;

    while (fscanf(file, "%16s", word) != EOF) {
        int len = strlen(word);
        memcpy(key, word, len);
        memset(key + len, 0x20, KEY_LENGTH - len);

        printf("Trying key: %s\n", word);

        ciphertext_len = encrypt((const unsigned char *)PLAINTEXT, strlen(PLAINTEXT), key, iv, ciphertext);

        if (ciphertext_len == sizeof(CIPHERTEXT) - 1 && memcmp(ciphertext, CIPHERTEXT, ciphertext_len) == 0) {
            printf("Key found: %s\n", word);
            fclose(file);
            return 0;
        }
    }

    printf("Key not found in the provided wordlist.\n");
    fclose(file);
    return 0;
}
