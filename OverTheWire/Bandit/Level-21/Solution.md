# Bandit 21 -> 22

This level introduces the concept of cron jobs and how they can be utilized to access hidden information.

--- 

### 🔧 Setup
We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit21
- **Password:** EeoULMCra2q0dSkYj561DX7s1CpBuOBt
### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "EeoULMCra2q0dSkYj561DX7s1CpBuOBt" ssh bandit21@bandit.labs.overthewire.org -p 2220
    ```

---

### 🎯 Finding the Flag

- Lets start off by reading the description on the overthewire website. It's mainly talking about cron jobs.

- We can run the `ls` command on the given directory which is `/etc/cron.d/`
- There we will find this file `cronjob_bandit22` and on further reading into the file we can find one more file, a script to be specific `/usr/bin/cronjob_bandit22.sh`
- On reading into the new script we can see that all its doing is the following:
  * Empty a file thats stored under `/tmp/` directory
  * Then the password/flag that we want is stored into that file `every time the computer starts or reboots`
- All we have to do is copy the path and just 
  ```bash
  cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
  ```

- and that should give us the flag.

### 🏁 Flag: `tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q`
