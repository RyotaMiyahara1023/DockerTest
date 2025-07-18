#include <stdio.h>

int main() {
    char buf[1000];
    if (fgets(buf, sizeof(buf), stdin) != NULL) {
        printf("%salgo!", buf);
    }
    return 0;
}