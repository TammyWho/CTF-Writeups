# Bandit 17 -> 18

This was a nice level as it introduces us to the `diff` command.

--- 

### 🔧 Setup
We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit17
- **Password:** EReVavePLFHtFlFsjn3hyzMlvSuSAcRD

### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "EReVavePLFHtFlFsjn3hyzMlvSuSAcRD" ssh bandit17@bandit.labs.overthewire.org -p 2220
    ```

---

### 🎯 Finding the Flag

- We start off by logging into the ssh session.

- We see two files called `passwords.old` and `passwords.new` on running `ls` command

- `diff` command is fairly intuitive , and the following command will give us the flag:

```bash
diff passwords.old passwords.new
```

- on running the above command we will see an output like following:

```bash
42c42
< C6XNBdYOkgt5ARXESMKWWOUwBeaIQZ0Y
---
> x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO
```

- The last line is the new and changed line and our flag.

### 🏁 Flag: `x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO` 
