*PWNABLE.KR* has some of the most amazing reverse engineering challenges, or so i have heard.
So today we are starting with the first challenge on the page called *FD*

---
## Basic Recon
Lets start by using ssh and then running the program intended.
```Bash
fd@ubuntu:~$ ls
fd  fd.c  flag
fd@ubuntu:~$ ./fd
pass argv[1] a number
fd@ubuntu:~$ ./fd 2
learn about Linux file IO
fd@ubuntu:~$ ./fd 1
learn about Linux file IO
```

So we have a program that asks for an input and then asks to learn about `linux file IO`, so let's do just that before anything else.

---
## Linux File IO
In Linux and other Unix-like systems, there are three default files named below which are also identified by the shell using file descriptor numbers:

1. **stdin or 0** – it’s connected to the keyboard, most programs read input from this file.
2. **stdout or 1** – it’s attached to the screen, and all programs send their results to this file and
3. **stderr or 2** – programs send status/error messages to this file which is also attached to the screen.

Okay maybe that doesnt make a lot of sense but think of file descriptors as pipes.
- 0 pipe only takes input 
- 1 pipe only gives output
- 2 pipe is a sewer giving out errors

---
## Code
To understand more on what to do we can read the code. If it was given with the challenge im using it :) 

```C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char buf[32];
int main(int argc, char* argv[], char* envp[]){
        if(argc<2){
                printf("pass argv[1] a number\n");
                return 0;
        }
        int fd = atoi( argv[1] ) - 0x1234;
        int len = 0;
        len = read(fd, buf, 32);
        if(!strcmp("LETMEWIN\n", buf)){
                printf("good job :)\n");
                setregid(getegid(), getegid());
                system("/bin/cat flag");
                exit(0);
        }
        printf("learn about Linux file IO\n");
        return 0;

}
```

- So the code first checks if there even is an arguement given with the program
- If it is, then its stored into `fd` 
	- now our input goes through `atoi()` which just converts ascii to numbers 
	- and then `0x1234` is subtracted from our input.
- Whats interesting is the `len` variable which
	- `read`s from file descriptor `fd` upto 32 characters in `buf` variable.
- After that there is a `string compare` with our `buf` variable as following
	- if the compare is successful then we , in simple terms get the flag.
		- in more detail, the `setregid()` function sets the permissions needed for it to read the flag file.
	- If the compare is unsuccessful, then it prints the text asking us to study linux file IO

Now this actually helps us understand what to do next.
We can give an input which after being subtracted by `0x1234` should give us a valid file descriptor, ideally 0 since thats the `input` file descriptor.

To do that we simply just need to know the int value of `0x1234` which can easily be done in python.
```python
fd@ubuntu:~$ python
Python 3.10.12 (main, Feb  4 2025, 14:57:36) [GCC 11.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> 0x1234
4660
```

Lets try it right away
```bash
fd@ubuntu:~$ ./fd 4660
LETMEWIN
good job :)
Mama! Now_I_understand_what_file_descriptors_are!
```
After giving our input we get space to give the `LETMEWIN` text so the `strcmp` is successful.
And so we get our flag

---
# Flag: `Mama! Now_I_understand_what_file_descriptors_are!`