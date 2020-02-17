# BLIHNIT

Small script to init BLIH repository easily. 

## Description

BLIHNIT was initially a simple and small script that was easier than BLIH to create a git repo.
This script now also allows you to add write and read access to other blih users when they are added as parameters, to list, to delete blih repositories.

## Installation
The installation process is simple, the installation script will copy `blihnit.sh` to your `/usr/bin/`. If needed, your sudo password will be asked. After this, the script will ask for your blih credentials and will generate a token which will be stored in `~/.config/`. This config file containing your token will then be used by BLIHNIT to create your git repo.

Standard installation with email and token saved in a config file:
```
./install.sh
```

If you do not want BLIHNIT to store a token, you can use the following command during installation and only a copy of the script will be made. However, at each launch, BLIHNIT will ask you for your identifiers.

Basic installation without any save:
```
./install.sh -n
```
## Update
Update blihnit:
```
blihnit -u
```

## Usage

Basic repository creation:
```
blihnit $REPOSITORY_NAME
```

Create a repository and give read and write ACL to every given account:
```
blihnit $REPOSITORY_NAME firstname.lastname firstname2.lastname2...
```

List repository:
```
blihnit -l
```

Delete a repository:
```
blihnit -d $REPOSITORY_NAME
```

Delete multiple repositories:
```
blihnit -d $REPOSITORY_NAME1 $REPOSITORY_NAME2 $REPOSITORY_NAME3...
```

## Report a bug

If you find a bug, feel free to create a new issue explaining what's the issue.

## Feature request

If you have a feature idea, feel free to create a new issue explaining what's the feature you want to be added.
