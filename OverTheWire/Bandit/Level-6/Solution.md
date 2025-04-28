# Bandit 6 -> 7

This was fun to, you get introduced to more tags in `find` command
I also am gonna introduce you all to `/dev/null` , although the ctf does introduce to this topic way later.

---

### 🔧 Setup
We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit5
- **Password:** HWasnPhtq9AVKe0dmk45nxy20cvUa6EG

---

### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "HWasnPhtq9AVKe0dmk45nxy20cvUa6EG" ssh bandit6@bandit.labs.overthewire.org -p 2220
    ```

---

### 🎯 Finding the Flag

Again another fun level. I mean it had me googling.

- We start off by logging into the ssh session. But this time we see no directories.
- The challenge mentions that the file we are looking for could be anywhere in the system.
- So we run the find command on the **ROOT** directory **/**
- So to understand whats a root directory or the whole file structure in short you should **GOOGLE**. 
Trust me that habit to google and the skill to calmly read and digest what you read comes in handy.
- Anyways to get the file we can run the following command:
```bash
find / -size 33c -user bandit7 -group bandit6 2>/dev/null
```
Now the `-user` and `-group` are tags you could easily read and learn about through the man pages. 
What I wanna share here is this part: `2>/dev/null`
Now there are file descriptors in linux. Think of them as pipes for some function.
File descriptor `1` is for standard input. and `2` is for standard output.

Now whats `/dev/null`? 
I think of it as the black hole of linux. Whatever you send in it just.... disappears *poof*

Now what is the snippet `2>/dev/null` really doing? 
It's saying :
`Hey I know you are showing a lot of errors and thanks but no thanks, go straight into the black hole.`
In other words it helps us ignore any errors that might've been in our output. 

And well we get the flag on running the above command.

### 🏁 Flag: `morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj`
