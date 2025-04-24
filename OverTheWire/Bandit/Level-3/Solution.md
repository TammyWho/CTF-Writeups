# Bandit 3 -> 4

In this level we are introduced to commands like `cd` and hidden files in unix like systems. 

---

### 🔧 Setup

We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit3
- **Password:** MNk8KNH3Usiio41PRUEoDFPqfxLPlSx

---

### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "MNk8KNH3Usiio41PRUEoDFPqfxLPlSx" ssh bandit3@bandit.labs.overthewire.org -p 2220

---

### 🎯 Finding the Flag
I also learned something in this level as hidden files previously only used to consist of single dot (.) but in this challenge we see one with three dots (...)

Either way the method of solving is going to be very similar with the autocompletion feature of bash that we trigger by hitting <TAB>

- So we first run `ls` command and we find a directory named *"inhere"*
- We can use the command `cd` to change directory 

**Here's when you gotta google and read man pages, you can read man pages with the command `man <command>`**

- After changing our directory we can use the `ls` command with `-a`.
Something like this: 
```bash 
ls -a 
```
**You should be able to find the above command all on your own. Just breathe and read the man pages.**

Anyways all we gotta do now is use the `cat` command and put the file name there. 
Or we could just `cat <TAB>` which would autocomplete the filename for us.

###  🏁 Flag: `2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ` 
