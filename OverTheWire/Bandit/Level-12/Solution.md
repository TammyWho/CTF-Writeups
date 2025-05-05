# Bandit 12 -> 13

We are introduced to zip file formats. Yep its not only rar. There's a lot of zip file types. **A LOT**

--- 

### 🔧 Setup
We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit12
- **Password:** 7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4

### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4" ssh bandit12@bandit.labs.overthewire.org -p 2220
    ```

---

### 🎯 Finding the Flag

This was a very tough level. It's difficulty is mainly due to the manual searching we have to do on google. I still havent came across any script for this level and won't be able to write a bash script for this level just yet. Automation for this level seems very difficult to me.

- We start off by logging into the ssh session.

- We are now supposed to make a temporary directory in the `/tmp` directory. 
This is because we are going to unzip a lot of files and rename a lot of files and phew. It's gonna be a while so strap in and put in that command
```bash
mktemp -d
```

- Now we can copy the directory name and run a copy command , we are copying the original file since we wouldnt want to lose the original file. And we `cd` into the new directory we created.

```bash
cp data.txt <directory_name_here_without_these_pointy_brackets_ofcourse>
cd <directory_name>
```

- Now we can run commands like `file` or `cat` to see what the file is or what it contains. 
We will learn that its hexdump of a file and to turn it into binary we can run the following command.

```bash
xxd -r data.txt > binary
```

- When we run the file command on the new `binary` file , we can learn that its a gzip compressed file. And to unzip it it has to be in the `gz format`. Which just means we have to rename it with the extension `.gz`. We can do that using the mv command.

```bash
mv binary binary.gz
```

- After running the above command we can unzip it using the gzip terminal utility.

```bash
gzip -d binary.gz
```

- Now on running `ls` we wont see anything out of ordinary but if we run `file` on binary we can see we successfully unzipped the file and got a bzip2 compressed file instead.

- Now we google again on what extension does a bzip2 compressed file has and how to decompress it. After some researching you should learn that bzip2 compressed file has `.bz2` extension. So the steps are to rename the file and unzip it and repeat.

```bash
mv binary binary.bz2
bzip2 -d binary.bz2
```

 I'll talk about one more zip formats and show how to decompress it.

- `POSIX archive` these files have extensions as `.tar.gz` and can be decompressed by following command:
```bash
tar -xvf binary.tar.gz
```

**This level really tests ur determination. You are supposed to constantly google, Learn, Apply what you learnt and move on to the next challenge. I wish you luck for the rigorous decompressing you will go through for this level**

- After a lot of decompressing we should get the file with the flag in it.

 ### 🏁 Flag: `FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn`
