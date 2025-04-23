# Bandit 2 -> 3

This level is very similar to previous one it introduces us to well "spaces in filenames"

---

### 🔧 Setup
We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit2
- **Password:** 263JGJPfgU6LtdEvgfWU1XP5yac29mFx

---

### 🔑 Logging in via SSH
- Using the above details we can connect to the machine with the following command
    ```bash
    sshpass -p "263JGJPfgU6LtdEvgfWU1XP5yac29mFx" ssh bandit2@bandit.labs.overthewire.org -p2220
    ```

---

### 🎯 Finding the Flag

After connecting to the server, we can run a basic command like ls to check what's in the current directory. You'll see a file named (spaces in this filename) 

Now you might try to read it with cat space , and if u have enough experience in coding especially with IDE's you will figure it out, out of habit.

So IDE's use the TAB key to autocomplete the name of a variable or a function or its template. And if u write 
```bash
cat spaces <TAB>
```
It would autocomplete it for you which is neat. Thanks Bash! 

**I highly encourage searching a lot on google or ducduckgo on each level if you are new to linux or computers.**

Anyways if u wanted to do it manually you could do a simple google search and come across two methods.
    1. Write the file name with (\) before spaces.
        for example:- *spaces\ in\ the\ filename*
    2. Or you could use (") which i prefer personally
        for example:- *"spaces in the filename"*

Let's move on to the next level without wasting anytime.

###  🏁 Flag: `MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx` 
