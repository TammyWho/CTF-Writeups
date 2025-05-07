# Bandit 15 -> 16

We are introduced to ssl encryption in ncat in this level. We learn a bit more about the encryption services we have and use in this level.

--- 

### 🔧 Setup
We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit15
- **Password:** 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo

### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo" ssh bandit15@bandit.labs.overthewire.org -p 2220
    ```

---

### 🎯 Finding the Flag

This server took me a little time but only because i was looking at the wrong places.

- We start off by logging into the ssh session.

- After logging in we can read the `man pages` of `ncat` command and type `/ssl` to search for the term `ssl`

- After reading a bit we can see the `-ssl` tag and thats all we need. Hence the following command will give us the flag:

```bash
echo "8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo" | ncat --ssl localhost 30001
```

### 🏁 Flag: `kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx` 
