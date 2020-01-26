# BLIHNIT

Small script to init BLIH repository easily. 

## Installation
Standard installation with email and token saved in a config file:
```
./install.sh
```

Basic installation without any save:
```
./install.sh -n
```
## Usage

Basic repository creation:
```
blihnit $REPOSITORY_NAME
```

Create a repository and give read and write ACL to every given account:
```
blihnit $REPOSITORY_NAME firstname.lastname firstname2.lastname2
```
