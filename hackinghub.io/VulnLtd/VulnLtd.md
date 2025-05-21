## Scope 
`https://uaqrg2ua.vulnltd.co.uk`

## Enumeration

**NOTE** I kept getting errors when i tried to enumerate and i dont know why but it was because i put `https` instead of `http` in the command

### Subdirectories
```bash
[hermione@hogwarts VulnLtd]$ ffuf -w ../wordlists/subdomains.txt:FUZZ -u http://uaqrg2ua.vulnltd.co.uk/FUZZ 

        /'___\  /'___\           /'___\       
       /\ \__/ /\ \__/  __  __  /\ \__/       
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\      
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/      
         \ \_\   \ \_\  \ \____/  \ \_\       
          \/_/    \/_/   \/___/    \/_/       

       v1.0.2
________________________________________________

 :: Method           : GET
 :: URL              : http://uaqrg2ua.vulnltd.co.uk/FUZZ
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 40
 :: Matcher          : Response status: 200,204,301,302,307,401,403
________________________________________________

contact                 [Status: 200, Size: 3106, Words: 818, Lines: 82]
css                     [Status: 301, Size: 178, Words: 6, Lines: 8]
images                  [Status: 301, Size: 178, Words: 6, Lines: 8]
:: Progress: [1907/1907] :: Job [1/1] :: 158 req/sec :: Duration: [0:00:12] :: Errors: 0 ::
```

We Can see the subdirectories that we can just see on the page there is nothing new.

There is one subdirectory i had initially forgotten
### robots.txt
I forgot to include this in as this was where i wouldve gotten a good start.
But here we find the first flag
![Flag1](media/Flag1.png)

### Subdomains / Virtual Hosts
```bash
[hermione@hogwarts VulnLtd]$ ffuf -w ../wordlists/subdomains.txt:FUZZ -u http://uaqrg2ua.vulnltd.co.uk/ -H "Host:FUZZ.uaqrg2ua.vulnltd.co.uk" 

        /'___\  /'___\           /'___\       
       /\ \__/ /\ \__/  __  __  /\ \__/       
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\      
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/      
         \ \_\   \ \_\  \ \____/  \ \_\       
          \/_/    \/_/   \/___/    \/_/       

       v1.0.2
________________________________________________

 :: Method           : GET
 :: URL              : http://uaqrg2ua.vulnltd.co.uk/
 :: Header           : Host: FUZZ.uaqrg2ua.vulnltd.co.uk
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 40
 :: Matcher          : Response status: 200,204,301,302,307,401,403
________________________________________________

support                 [Status: 200, Size: 1067, Words: 242, Lines: 31]
www                     [Status: 200, Size: 3753, Words: 898, Lines: 100]
:: Progress: [1907/1907] :: Job [1/1] :: 146 req/sec :: Duration: [0:00:13] :: Errors: 0 ::
```

Here we find a new page `support.uaqrg2ua.vulnltd.co.uk` which seems like a support ticket functionality. 

## New Endpoints 
- ### `http://efuxx0w.vulnltd.co.uk/contact`
    Now this functionality of the web app doesnt really work no matter what we put in.
- ### `http://efuxx0w.vulnltd.co.uk/secr3t_l0g1n/`
    We can find a login page here and on opening the documentations we can learn some useful information
    ![secret_login_docs](media/sec_login_docs.png)

    So we can brute force the login page using the following credentials
    - username: guest
    - password: monday, tuesday, wednesday, thursday, friday, saturday, sunday
    
    So time to open caido.
    ![bruteforcingattempt](media/bf1.png)
    ![bruteforcing_exploited](media/bf2.png)
    
    We found the vulnerable credentials and lets put on the intruder and try to login 
    On a simple login as the guest we can see this page which have couple of useful details

    ![Secret_Login_Dashboard](media/dashboardg.png)

    One useful endpoint we found is `http://vulnltd.slack.com`

    We cant seem to access the other functionality so lets logout and log in as an admin.
    ![logging_in_as_admin](media/admin_login.png)
    We can change the value here from `false` to `true`
    ![Flag2](media/Flag2.png)
    And we can get the Second Flag

- ### `http://support.efuxx0w.vulnltd.co.uk`

## New Endpoint 

- ### `http://jefuxx0w.vulnltd.co.uk/secr3t_l0g1n/page/3`
    We can see the request and see the admin=false in the request again
    ![New_Contact_Page_In_Request](media/new_contact.png)

    On accessing the page we can see an email id and why the old contact page didnt work.
    ![new_emai_found](media/new_email_found.png)

    `start-ticket-jefuxx0w@vulnltd.co.uk`

    If we send a email to this id we will get an email in return. we can just send a mail with test as subject and test in the text
    ![Flag3](media/Flag3.png)

    So we got the flag and we get a new endpoint

- ### `http://vulnltd.slack.com`
    ![vulnltd_slack_page](media/vuln_slack.png)

## New Functionality of the New Page

- ### `http://support.jefuxx0w.vulnltd.co.uk/he62wiwMVQ/1`
    ![New_Functionality](media/view_function.png)
    On checking out the new function we will realise that the page we have is like an email inbox. And the emails sent to `he62wiwMVQ-support-jefuxx0w@vulnltd.co.uk
` Can be viewed here. 

So now what we can do is create an slack account using the new email. and then access the slack channel.
![Creating_Slack_Acc](media/creating_acc.png)
We should receive a confirmation email.
It will take some time, this email thing is not exactly the fastest but its very realistic.
![Email_Confirmation_Received](media/confirmation_mail_received.png)
We can see on refreshing the page that we received a mail
So lets activate the account and then join the slack group where we will get more useful information
![Confirm_Email](media/confirm_email.png)

- ### Log In the slack channel
    We can create a dummy account and in the `#general` channel we can find one more flag
    ![slack_channel](media/slack_channel.png)
    We can see the Fourth flag and a new endpoint.

## New Endpoint
- ### `http://159.65.211.63/login` 
   ![Router_Login_Page](media/router_login.png) 
   We can see its a pirelli router. Now we can do a simple google search to find the most comman default username and pass. 
   We will learn that the following credentials works
   - username: admin
   - password: microbusiness
   ![Router Dashboard](media/router_dashboard.png)

   Here we can see another flag and we can try to click on every functionality but we will only be able to see the backup config file.
   The file contains a base64 encoded string which when decoded will give the following json output
   ```json
    {"wan":{"type":"adsl","isp":{"ip":"dhcp","username":"09732837999@dslnet","password":"d3FpPo5ew"}},"lan":{"ip":"192.168.1.1","subnet":"255.255.255.0"},"firewall":{"active":true},"maintenance":{"admin_user":"admin","admin_pass":"microbusiness","enable_on_wan":true,"http_port":80},"websites":[{"active":true,"name":"\/intranet","protected":{"type":"basic_auth","username":"internet","password":"4gH2kO9e1cE53Mk"}}],"flag":"[^FLAG^F4AC9478B71EA056A1B2DE0DF824AC61^FLAG^]"}
    ```

    Above we can see the second last flag of this challenge which is just more of nudge in the right direction

- ### `http://159.65.211.63/intranet`
    On visiting the page we can provide the following credentials found from the backup config
    "username":"internet"
    "password":"4gH2kO9e1cE53Mk"
    ![Intranet_Page](media/intranet.png)
- ### New functionality
   ![Last_Func](media/last_func.png) 
   So this functionality doesnt really work but we can see what we want which is the admin.php page. 
   In the html code of the previous page we can see a comment with really useful hints 
   ![source_code](media/phphacking.png)
   So we can change the php thing above to this 
   ```php
   http://159.65.211.63/intranet/index.php?page=adminadmin.php.php&home.html
   ```
   So we wrap `admin.php` with `admin.php` that way when it detects and removes `admin.php` we would still have the admin.php in the request/query.

   And hence we get the last flag 
   ![Last_Flag](media/Last_FLag.png)

---

**PHEW THIS ONE WAS HARD**
I am very new to web sec and this was really really hard for me. But thanks to multiple writeups on youtube (Love you guys) I was able to learn and have my mind blown.

I hope you guys learnt something with this level.
