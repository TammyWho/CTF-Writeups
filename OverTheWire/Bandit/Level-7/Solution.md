# Bandit 7 -> 8

We get introduced to commands like `strings` and `grep`

---

### 🔧 Setup
We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit7
- **Password:** morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj

### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj" ssh bandit7@bandit.labs.overthewire.org -p 2220
    ```

---

### 🎯 Finding the Flag

This was fairly easy to me as in your day to day tasks you would have to use commands like `strings` and `grep`.

- We start off by logging into the ssh session. And we see a file called `data.txt`
- You theoretically could just `cat data.txt` and look for the word **millionth** but thats not that time efficient. Definetly not `hacker-like`
- **READ MAN PAGE ON STRINGS AND GREP**
- I used the following command to get the pass:
```bash
cat data.txt | grep -i "millionth" | cut -f2
```

- I might've forgotten to talk about this `|` before. 
    It's the symbol used to `pipe` commands.
    Now piping commands is just a way to like feed input to another command.
    Basically we are linking commands. I'll explain the above command to help understand.
    So `cat data.txt` prints all the text inside the file data.txt. 
    When we `pipe (|)` it to another command we are literally giving the contents of data.txt as input to the next command , which in our case is:
    `grep` , It helps you find matching and invert matching the words you provide.
    So what our command does is 
    `look for the word "millionth"` in the file data.txt
    `-i` is saying `regardless of it's case` so millionth could be upper case or lower case it would give both in the result.
    **Now till here is enough to get what you need, next is just me trying to perfection the output**
    We pipe this output to the `cut` command .
    `cut` command just helps you print specific parts of the data we provided ,
    So to print the first column we would write it with `-f1` and for 2nd column `-f2`
And we will get the flag yea.

### 🏁 Flag: `dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc`
