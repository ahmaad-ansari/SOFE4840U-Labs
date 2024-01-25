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

void encrypt(const char *plaintext, int plaintext_len, const unsigned char *key, const unsigned char *iv, unsigned char *ciphertext, int *ciphertext_len) {
    EVP_CIPHER_CTX *ctx;
    int len;

    if(!(ctx = EVP_CIPHER_CTX_new())) handleErrors();

    if(1 != EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv))
        handleErrors();

    if(1 != EVP_EncryptUpdate(ctx, ciphertext, &len, plaintext, plaintext_len))
        handleErrors();
    *ciphertext_len = len;

    if(1 != EVP_EncryptFinal_ex(ctx, ciphertext + len, &len)) handleErrors();
    *ciphertext_len += len;

    EVP_CIPHER_CTX_free(ctx);
}

int main() {
    unsigned char key[16] = "abjudicate"; // Key
    while (strlen((char *)key) < 16) strcat((char *)key, " "); // Padding the key
    unsigned char iv[16] = {0}; // Initialization Vector, all zeros
    unsigned char *plaintext = (unsigned char *)"This is a top secret."; // Plaintext
    unsigned char ciphertext[128];
    int ciphertext_len;

    printf("Starting Encryption...\n");
    print_hex("Key", key, 16);
    print_hex("IV", iv, 16);
    printf("Plaintext: %s\n", plaintext);

    encrypt((char *)plaintext, strlen((char *)plaintext), key, iv, ciphertext, &ciphertext_len);

    print_hex("Ciphertext in hex format", ciphertext, ciphertext_len);

    return 0;
}
