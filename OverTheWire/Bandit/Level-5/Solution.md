# Bandit 5 -> 6

Very interesting level as it introduces us to `find` command and has us use a couple of tags which require a lot of reading through man pages and google.

---

### 🔧 Setup
We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit5
- **Password:** 4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw

---

### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw" ssh bandit5@bandit.labs.overthewire.org -p 2220
    ```

---

### 🎯 Finding the Flag

This was a fun level. We get to learn a new command with so many tags.
The command in question is `find`

- Start off by logging into the ssh and `cd` into the `inhere` directory.
- **READ THROUGH THE MANPAGES AND TRY AND EXPERIMENT**
- You would learn that `find` command has tags like `-size`(which is actually what we all need for this level) and `-type`
- to find the flag we can run the following command:
```bash
find . -type f -size 1033c
```

Here,
    - `f` stands for regular files 
    - `1033c` stands for 1033 Bytes.

- After getting the file name we can simply copy it and paste it infront of the `cat` command and we should get the flag

### 🏁 Flag: `HWasnPhtq9AVKe0dmk45nxy20cvUa6EG`

