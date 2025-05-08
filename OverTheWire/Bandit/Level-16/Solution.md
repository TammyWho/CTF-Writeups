# Bandit 15 -> 16

Now this level was a a CTF like level. We combine lot of our previous learned knowledge.That includes ssl encryption and sshkeys.

--- 

### 🔧 Setup
We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit16
- **Password:** kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx

### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx" ssh bandit16@bandit.labs.overthewire.org -p 2220
    ```

---

### 🎯 Finding the Flag

- We start off by logging into the ssh session 

- The helpful links encourages us to look into port scanners. And one of the best or atleast the most popular port scanners is `nmap`

- anyways we can run the following command to find out which ports have ssl encryption:

```bash
nmap localhost -sV -p31000-32000
```

- Then we'll get a list of ports 4 or 5 i think. Now you can see all the services that are using ssl encryption and you can use them like we did for past few levels using ncat.

```bash
echo "kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx" | ncat --ssl localhost 31790
```

And we will get a ssh private key which we should be able to identify as we used it last time.

- Now we can copy this key and paste it into a text file and name it as `sshprivate.key` or something.

- Before we can use this ssh key we have to give it the right permissions

```bash
chmod 600 sshprivate.key
ssh -i sshprivate.key bandit17@localhost -p2220
```

- Using the above commands we should be able to log into the ssh session. And we should get the flag on running the command below.

```bash
cat /etc/bandit_pass/bandit17
```

### 🏁 Flag: `EReVavePLFHtFlFsjn3hyzMlvSuSAcRD`
