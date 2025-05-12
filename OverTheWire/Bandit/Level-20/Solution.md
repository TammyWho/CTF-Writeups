# Bandit 20 -> 21

This was a good level since I struggled with it myself. We are introduced to the concept of `unix jobs` in this level

--- 

### 🔧 Setup
We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit20
- **Password:** 0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO

### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO" ssh bandit20@bandit.labs.overthewire.org -p 2220
    ```

---

### 🎯 Finding the Flag

- Lets start off by logging into the session as usual. We can notice the `suconnect` file on running `ls` command.

- We can run the `suconnect` file to understand what it does.
So apparently suconnect connects to the port we give as parameter and listens for an input , the current level password. If we give the correct input it will give us the pass for level 21 

- So we have to set up a client like following:

```bash
echo "0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO" | nc -l -p 1234 &
```

Now you might notice the `&` at the end. Its used to run commands in the background. We can bring background processes to the foreground using `fg` command. We can see which processes are running in the background with `jobs`

- After the above command we can run the following command and we should get the password:

```bash
./suconnect 1234
```

**NOTE** : Now when I was solving this level it didnt for me for unknown reason. How I solved it was by running the same process twice , as in running the below command once again:

```bash
echo "0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO" | nc -l -p 1234 &
```

- Hence we should get the following flag

### 🏁 Flag: `EeoULMCra2q0dSkYj561DX7s1CpBuOBt`
