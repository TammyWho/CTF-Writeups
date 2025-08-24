# Bandit 21 -> 22

This is a similar level to before but , we are going to write our first shell script here. And we should be proud of ourselves when we solve this level. 

---

### 🔧 Setup
We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit22
- **Password:** tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q
### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q" ssh bandit22@bandit.labs.overthewire.org -p 2220
    ```

---

### 🎯 Finding the Flag

Now writing a script might seem intimidating. But I believe a lot of people in CS do have some basic coding experience and hence this should be fairly easy 

  - We start off by reading the cron job at `/etc/cron.d/cronjob_bandit23`
  - Soon enough we know of the script at `/usr/bin/cronjob_bandit23.sh` and we can try to understand what the script does.
  - We can pretty much copy the script and use it as a basic template which i did and saved me some time. I'll paste my script here that i used to solve the challenge.
  ```bash
#!/bin/bash

myname=bandit23 
mytarget=$(echo "I am user $myname | md5sum | cut -d ' ' -f 1")

echo "$mytarget and the password is: "
cat "/tmp/$mytarget"

#echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

#cat /etc/bandit_pass/$myname > /tmp/$mytarget
```
  - In the above script we can see the first line `#!/bin/bash` , thats a shebang.
    _This line tells the operating system to run this file using the interpreter program /bin/sh, in this case the standard Unix shell ._ (Definition copied from wikipedia. It's a good habit to read through documents like wikipedia or manpages instead of Asking AI :)
  - we can see some variables being declared and like python they dont seem to have their identifiers like `int/char/bool`. Also they seem to have no spaces between the variable name, = and the variable value.
  - If we read through the script we can see that its creating a target called *mytarget* and its using some MD5 algorigthm to modify it a bit.
  - It then writes the passwordfile to this target file under `/tmp/` directory
  - So all we have to do is figure out what the *mytarget* is and read the file at `/tmp/$mytarget`
  - To figure out mytarget we need myname, which we can safely assume is bandit23
  - So we can write a script similar to mine under a temporary directory. To make one and later to make the script executable we can follow these steps:
  ```bash
bandit22@bandit:~$ mktemp -d
/tmp/tmp.qGmiOMhCnp
bandit22@bandit:~$ vim /tmp/tmp.qGmiOMhCnp/script.sh
bandit22@bandit:~$ chmod +x /tmp/tmp.qGmiOMhCnp/script.sh
bandit22@bandit:~$ /tmp/tmp.qGmiOMhCnp/script.sh
```

  - And that should just give us the flag.

### 🏁 Flag: `0Zf11ioIjMVN551jX3CmStKLYqjk54Ga`
