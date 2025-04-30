# Bandit 8 -> 9

Another good level. And i was stuck on it for the dumbest reason. I had logged into incorrect ssh session lol.

--- 

### 🔧 Setup
We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit9
- **Password:** 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM

### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "4CKMh1JI91bUIZZPXDqGanal4xvAg0JM" ssh bandit9@bandit.labs.overthewire.org -p 2220
    ```

---

### 🎯 Finding the Flag

Now I dont really like regex challenges. It looks like wizardry to me.
But this is a good revision challenge. This is like very start of regex

- We start off by logging into the **CORRECT** ssh session. Please dont be like me lol.o~~I logged into incorrect session and couldn't get the solution . So i annoyed couple of members on the discord channel. But hey they're a helpful nice bunch so thats cool~~

- We see data.txt again and the solution for this is fairly easy.
- We can use `strings` command to print the humand readable characters not only from a text file but from any files.
- We can pipe it to grep the `=` sign and well
- Following command can be used to get the flag:
```bash
strings data.txt | grep ==== 
```
- We use `====` because its said there will be several `=`'s 
- But to learn regex which is fairly important not only here but also in other applications like the ones we use in Incident & Response too.
```bash
strings data.txt | grep -E '={2,}' | tail -1 | cut -d ' ' -f 2
```
- The above command uses regex which might be little hard to understand at first. I'll try my best to explain.
```bash
grep -E '{2,}' 
```
`-E` -> Extended grep
`'={2,}'` -> this part just says "match any line that has 2 or more '='

- And hence we should get the flag

### 🏁 Flag: `FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey`
