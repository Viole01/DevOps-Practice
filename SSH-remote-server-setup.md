# SSH Remote Server Setup

https://roadmap.sh/projects/ssh-remote-server-setup

## SSH Key Creation

We will be creating the key-pairs on our local machine and then move them to the remote server.

SSH keys need to be stored in ``~/.ssh`` directory. If it's not already there, create it by running
```sh
mkdir ~/.ssh
```

To Create a new SSH key on a device, use the ``ssh-keygen`` tool. To create first key-pair, run:
```sh
ssh-keygen -t rsa -b 4096 -f ~/.ssh/rsa-key-1
```

To create the second key-pair,
```sh
ssh-keygen -t rsa -b 4096 -f ~/.ssh/rsa-key-2
```

## Storing Public Keys On Server

To make a SSH connection into a remote server, we need to move the public keys to the remote server.

Public keys have ``.pub`` file extension.

Connect to the remote server by an existing method, then copy the public key files. They will look something like this:
```
~/.ssh/rsa-key-1.pub
~/.ssh/rsa-key-2.pub
```
## Alias Setup for SSH Connection
To make setting up SSH connection easier without relying on hostname and user, we can create ana alias for it.

To make an alias for a connection, create a file ``~/.ssh/config``,
```sh
nano ~/.ssh/config
```

Add the following line in it:
```
Host <alias-name>
    HostName server.example.com/ip of server
    User <username>
    IdentityFile path/to/keyfile
```

Save and exit the file. Now you can SSH into your remote server by running
```sh
ssh <alias-name>
```