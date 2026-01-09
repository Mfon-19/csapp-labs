#include "csapp.h"

void sigint_handler(int sig) {
    printf("Caught SIGINT!\n");
    exit(0);
}

int main() {
    // install the sigint_handler
    if (signal(SIGINT, sigint_handler) == SIG_ERR)
        printf("signal error");
    
    pause(); // wait for receipt of signal
    return 0;
}
