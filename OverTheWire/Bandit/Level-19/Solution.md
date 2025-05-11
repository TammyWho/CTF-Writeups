# Bandit 19 -> 20

This was a very important level as it introduces us to this topic of `setuid`

--- 

### 🔧 Setup
We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit19
- **Password:** cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8

### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8" ssh bandit19@bandit.labs.overthewire.org -p 2220
    ```

---

### 🎯 Finding the Flag

**Setuid** is an important topic. You can think of it as using someone else's id card to do some action. 
With setuid set you could run commands like `id` or `cat` as another user which could give us access to files that our user might not have.

- So lets start off by logging into the ssh session and on running `ls` command we can see a file called `bandit20-do` . Which explains very simply what setuid does. With this program we can run commands as the user `bandit20`

- The following commands should be intuitive as the password file for every level is in `/etc/bandit_pass/banditXX` :

```bash
./bandit20-do cat /etc/bandit_pass/bandit20
```

And that will very easily give us the flag we want.

### 🏁 Flag: `0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO`
