#include "csapp.h"
#define MAXARGS 128;

void eval(char *cmdline);
int parseline(char *buf, char **argv);
int builtin_command(char **argv);

int main() {
    char cmdline[MAXLINE];
    
    while (1) {
        printf("> ");
        Fgets(cmdline, MAXLINE, stdin);
        if (feof(stdin))
            exit(0);

        eval(cmdline);
    }
}

void eval(char *cmdline) {
    char *argv[MAXARGS]; // argument list
    char buf[MAXLINE];  // what the user typed in the command line
    int bg; // run command in background or foreground?
    pid_t pid;  // the process id

    strcpy(buf, cmdline);
    bg = parseline(buf, argv);
    if (argv[0] == NULL)
        return; // empty line
    
    // if not a builtin command
    if (!builtin_command(argv)) {
        if ((pid = Fork()) == 0) {
            // filename, cmd line args, environment vars. pass to execve to run
            if (execve(argv[0], argv, environ) < 0) {
                printf("%s: Command not found. \n", argv[0]);
                exit(0);
            }
        }
        
        // not a background job. wait for foreground job to terminate
        if (!bg) {
            int status;
            if (waitpid(pid, &status, 0) < 0)
                unix_error(waitfg: waitpid error);
        }
    }
    return;
}

int builtin_command(char **argv) {
    if (!strcmp(argv[0], "quit"))
        exit(0);
    if (!strcmp(argv[0], "&"))
        return 1;
    return 0;
}

// parse the command line and build the argv array
int parseline(char *buf, char **argv) {
    char *delim; // point to first space delimeter
    int argc; // num of args
    int bg;

    buf[strlen(buf) - 1] = ' '; // contains trailing \n, replace with space
    while (*buf && (*buf == ' '))
        buf++; // ignore leading spaces
    
    argc = 0;
    while ((delim = strchr(buf, ' '))) {
        argv[argc++] = buf; // set this index to whatever is in buf
        *delim = '\0';
        buf = delim + 1; // what is this? looks like 0 + 1, but why not just buf++
        while (*buf && (*buf == ' '))
            buf++;
    }
    argv[argc] = NULL;

    if (argc == 0)
        return 1;
    
    if ((bg = (*argv[argc - 1] == '&')) != 0)
        argv[--argc] = NULL;
    
    return bg;
}






































