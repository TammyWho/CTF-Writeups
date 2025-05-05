# Bandit 13 -> 14

Ironically we are introduced to ssh again in this level. But we learn a bit more about ssh keys in this level

--- 

### 🔧 Setup
We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit13
- **Password:** FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn

### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn" ssh bandit13@bandit.labs.overthewire.org -p 2220
    ```

---

### 🎯 Finding the Flag

This is an interesting level because we end up logging into an ssh session inside of an ssh session. **FUN**

- We start off by logging into the ssh session. And from reading the challenge description we can realise that we are supposed to log into `bandit14` from `bandit13`'s computer basically.

- To do that we can see the ssh private key on `ls`. And we can login to bandit14 with the help of following command:

```bash
ssh -i sshkey.private bandit14@localhost -p 2220
```

- After logging in as `bandit14` we just have to `cat` at the file path given to us in challenge description

```bash
cat /etc/bandit_pass/bandit14
```

- And we should get the flag.

### 🏁 Flag: `MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS`
