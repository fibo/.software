.software
=========

> build & install software locally

# Why install software locally ?

If you have root rights or sudo with a package manager, __don't use me!__.

But, sometimes you are in one of the following scenarios

* your host is too old, without vendor support
* you have not root rights, and you need to keep your software update
* you need to compile and customize your builds
* you want to compile from sources you trust
* you want to try new releases without waiting until they are packaged
* you are a nerd
* you are a nerd, and it is saturday night

# Usage

`.software` has only one feature: installing software locally !

It is implemented by a bash function named `.software_install` the takes only
one parameter: what you want to install. For example

```bash
$ .software_install Foo
```

# Installation

## Get it

Just go to your home dir and clone this repo.

```bash
$ cd
$ git clone https://github.com/fibo/.software.git
```

If you don' t have git installed you can try the following commands

```bash
$ cd
$ wget --no-check-certificate https://github.com/fibo/.software/archive/master.zip
$ unzip master
$ mv .software-master .software
$ rm master
```

## Set your environment

For the impatient, just copy and paste the following line in your bash prompt and you are done!

```bash
grep 'source ~/.software/etc/profile' ~/.bash_profile || echo 'source ~/.software/etc/profile' >> ~/.bash_profile && source ~/.software/etc/profile
```

It will add `source ~/.software/etc/profile` to your *.bash_profile* **only once** and load *.software* features in your current session.

Otherwise you can add manually these lines to your `.bash_profile`.

Note that __if you are an Ubuntu user__ or you are using `.software` from  graphical
environment rather tha a remote server login shell, you should use `.bashrc` file instead.

```bash
#############################################################
### .software config start

##[optional]
# Set .software target dir, defaults to ~/.software
##
# export DOTSOFTWARE_ROOT_DIR=/path/to/your/software/installation/dir

##[required]
# Init .software
##
source ~/.software/etc/profile

### end .software config
#############################################################
```

# Environment

`.software` uses only one enviroment variable: `DOTSOFTWARE_ROOT_DIR`. It is the
dir where all your software will be installed.

You maybe want to edit it when

* you have not enough space in your home dir
* you want to install in a dir common to many users like `/usr/local` or `/opt`.


# Folder structure

Under *~/.software/etc* there is a folder for every software that can be installed.

Software _Foo_ has its homonym folder under *~/.software/etc* and contains an *installrc* file described below.

## installrc

Exports env vars needed for installation, like `SOURCES_URI`.
It can be used to override functions used by init.sh

* `_build`
* `_extract`
* `_get_sources`
* `_read_current_version_dir`

## ~/.software/etc/versions

Contains the list of software with corresponding version: **edit it** according to your needs.

# Packaging software

`.software` installs software locally downloading and compiling sources. This process can be time and cpu consuming, so, if you have two or more similar machines is not that difficut to build only once, then package your result and installing it on other hosts. The requirement are

* The hosts has the same system software (OS, kernel, etc) and environment.
* The variable `DOTSOFTWARE_ROOT_DIR` has the same value on every host. Note that, using default value implies that users has the same name.

If you are using default `.software` configuration you could just launch

```bash
$ cd
$ tar czf dotsoftware.tar.gz .software/
$ scp dotsoftware.tar.gz host1.example.com:~
$ ssh host1.example.com tar xzf dotsoftware.tar.gz
$ ssh host1.example.com rm dotsoftware.tar.gz
```

# Info

* __Author    :__ [G. Casati](http://g14n.info)
* __Repository:__ the repo of this software is hosted [here](https://github.com/fibo/.software)
* __License   :__ [MIT](http://g14n.info/mit-license/)

