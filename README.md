# DynamicIP-Mailing
Simple script that send an email if your IP changes

Only works with IPV4

The mailing function is disabled by default, you have to edit the file to uncomment the mail command at the end of the script.

You have to install the ssmtp package and configure it to make this script work.

```
  $ sudo apt install ssmtp
```

You have to configure ssmtp with your email provider.

```
  # Config file for sSMTP sendmail
  #
  # The person who gets all mail for userids < 1000
  # Make this empty to disable rewriting.
  root=your_email_address
  AuthUser=your_auth_user
  AuthPass=YourPassword
  
  # The place where the mail goes. The actual machine name is required no 
  # MX records are consulted. Commonly mailhosts are named mail.domain.com
  mailhub=your_smtp_server
  
  # Where will the mail seem to come from?
  rewriteDomain=Domain.com (can be gmail.com, outlook.com etc...)
```

To configure ssmtp, you can look for the needed configuration for your email provider on the net.

Next, you can uncomment :

```
  mail -s "New IP" -a "From:Name of Mail User <exemple@mail.com>" $1 < message.txt
```

And replace the Name of Mail User by anything you want and the exemple@mail.com by the email address that will send the email.

Then, you can test the script by typing :

```
  $ ./DynamicIP.sh exemple@mail.com
```

The argument will be the receiver.
