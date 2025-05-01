# Bandit 10 -> 11

We get introduced to base64 encoding! That gets me excited because on Operating System like Windows you would have to look up CyberChef or some base64 decoder. But Linux has it built in. **All for FREE** 

--- 

### 🔧 Setup
We already know the following challenge details:
- **Host(remote):** bandit.labs.overthewire.org
- **Port:** 2220
- **Username:** bandit10
- **Password:** FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey

### 🔑 Logging in via SSH

- Using the above details we can log in using the following command
    ```bash
    sshpass -p "FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey" ssh bandit10@bandit.labs.overthewire.org -p 2220
    ```

---

### 🎯 Finding the Flag

- Well this level is fairly easy so we log in and see a `data.txt` file in the home directory.
- **READ THE MAN PAGES FOR base64**
- One way to identify base64 encoding is to notice those `=` at the end of the text.
- The following command just gives us the flag its very simple
```bash
base64 -d data.txt
```

`base64` -> it's the commandline utility/tool we can use to encode and decode texts.
`-d` -> its the tag used to decode. And after tags we usually provide files as an input.

- And we should get the flag.

### 🏁 Flag: `dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr`

