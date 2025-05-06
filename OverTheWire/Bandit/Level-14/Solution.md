# Bandit 14 -> 15

We are introduced to ncat in this level. The helpful links in the challenge description encourages us to learn a lot about how internet started and how it works and stuff.

You might realise that lot of this stuff isnt used in the levels. But its the foundation as it helps us understand the technologies we use much better.

--- 

### 🔧 Setup
We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit14
- **Password:** MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS

### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS" ssh bandit14@bandit.labs.overthewire.org -p 2220
    ```

---

### 🎯 Finding the Flag

This was a relatively easy level for me. As ncat is used a lot in ctf's atleast.

- We start off by logging into the ssh session.

- We can now use `ncat` command to connect to `localhost` (it just means your current ip address or the domain name, which after using ssh would bandit.labs.overthewire.org)

- We can solve this challenge by 2 ways i prefer the 2nd method.

## 1st Method
```bash
ncat localhost 30000
```

- On running above command we well get a blank line/ blank space. You might not realise it but its waiting for your input. So if we just copy and paste the password for the current level that we used to login. we will get the flag in return

## 2nd Method
```bash
echo "MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS" | ncat localhost 3000
```

- Now there's not much difference only the `echo` part. I like this better because its quick and easy. In CTF's there's a lot of traffic ncat just times out or something, so its better in my opinion to just echo in what you need. 

- And yea on running any of the above commands you should get the flag

### 🏁 Flag: `8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo`
