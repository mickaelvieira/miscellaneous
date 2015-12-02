## Sudo warning message


```
We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.
```

```
$ sudo vim /etc/sudoers.lecture
$ sudo vim /etc/sudoers.d/privacy
```

```
Defaults        lecture_file = /etc/sudoers.lecture # alternate sudo lecture path
Defaults        lecture = always # always display the lecture
```

## SSH Welcome message

Customize the message of the day

```
$ sudo vim /etc/motd
```

Change ssh configuration

```
$ sudo vim /etc/ssh/sshd_config
```

```
PrintMotd no # Disable the message of the day
PrintLastLog no # Disable the last login message
```
