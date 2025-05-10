# Bandit 18 -> 19

This was a good level as it introduces us to using ssh to execute commands instead of logging into the session as usual.

--- 

### 🔧 Setup
We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit18
- **Password:** x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO

### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO" ssh bandit18@bandit.labs.overthewire.org -p 2220
    ```

On logging in we can see a `Bye Bye` msg , which means we can't connect to the ssh session this level.

---

### 🎯 Finding the Flag

Now this level wasnt that difficult for me as i have been writing bash scripts for this ctf and they heavily use this.

- Well instead of logging in we will execute a command using double quotes this time like shown below:

```bash
sshpass -p "x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO" ssh bandit18@bandit.labs.overthewire.org -p 2220 "ls"
#On executing above command we can see a readme file
sshpass -p "x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO" ssh bandit18@bandit.labs.overthewire.org -p 2220 "cat readme"
```

- And that should get us the flag

### 🏁 Flag: `cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8`
