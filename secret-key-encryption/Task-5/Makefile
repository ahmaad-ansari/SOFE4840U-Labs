INC=/usr/local/ssl/include/
LIB=/usr/local/ssl/lib/
all: find_key

find_key: find_key.c
	gcc -I$(INC) -L$(LIB) -o find_key find_key.c -lcrypto -ldl

clean:
	rm -f find_key
