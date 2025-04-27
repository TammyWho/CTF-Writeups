# Bandit 4 -> 5

In this level we are introduced to file command and human-readable files.

---

### 🔧 Setup

We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit4
- **Password:** 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ

---

### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ" ssh bandit4@bandit.labs.overthewire.org -p 2220
    ```

---

### 🎯 Finding the Flag

This was an interesting level as it had layers.
But the main theme was the `file` command

- So the first command `ls` as always and we see a directory named *"inhere"*
- `cd` into the *inhere/* directory and `ls` again 
- We will see multiple files named -file00 , -file01 ... etc.
- Now one could run `file ./-file00` manually for each one 

*BUT WE ARE HACKERS !!!~~and lazy~~*
- So we can simply run the following command:
```bash 
file ./* 
```
The star (*) here represents everything. You might know this before if you learned about SQL before.
You could also try 
```bash
file *
```
But that would fail clearly . Look back into one of the early levels where we were introduced to *dashed filenames* to understand.

- Now we can see that `-file07` has ASCII text. And ASCII is just the humand readable text. 
**We are supposed to look up "what's the only human readable characters?". We should be able to realise this after reading the challenge description**
- Final command should be intuitive now 
```bash
cat ./-file07
```

###  🏁 Flag: `4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw`
