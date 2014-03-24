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

    $ .software_install Foo

This will prepare your env sourcing `~/.software/Foo/installrc` and launch installation.

Note that you have to add manually a

    source ~/.software/Foo/profile

line to your `.bash_profile` (or `.bashrc`, see below).

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

Add these lines to your `.bash_profile`.

Note that __if you are an Ubuntu user__ or you are using `.software` from  graphical
environment rather tha a remote server login shell, you should use `.bashrc` file instead.

```bash
########################################################
### .software config start

# Set .software target dir, defaults to ~/.software
# [optional]
##
# export DOTSOFTWARE_ROOT_DIR=/path/to/your/software/dir

# Init .software
# [required]
##
source ~/.software/init.sh

# Load .software profiles
##
# source ~/.software/Node/profile
# source ~/.software/Python/profile

### end .software config
########################################################
```

## Finally

Load `.software` if you want to use it in your current shell session

```bash
$ source ~/.software/init.sh
```

# Environment

`.software` uses only one enviroment variable: `DOTSOFTWARE_ROOT_DIR`. It is the
dir where all your software will be installed.

You maybe want to edit it when

* you have not enough space in your home dir
* you want to install in a dir common to many users like `/usr/local` or `/opt`.


# Folder structure

`.software` folder contains the following files:

* README.md: this file
* init.sh: implements `.software_install` function, it is sourced by your `.bash_profile`

There is a folder for every software that can be installed.

Software _Foo_ has its homonym folder and contains the following files

* installrc
* profile

## installrc

Exports env vars needed for installation, like `SOURCES_URI`.
It can be used to override functions used by init.sh

* `_build`
* `_extract`
* `_get_sources`
* `_link_it`
* `_read_current_version_dir`

## profile

It is sourced by your `.bash_profile` (or `.bashrc`), user aware.

# Tips

## Packaging software

`.software` installs software locally downloading and compiling sources.
This process can be time and cpu consuming, so, if you have two or more similar
machines is not that difficut to build only once, then package your result and
installing it on other hosts. The requirement are

* The hosts has the same system software (OS, kernel, etc) and environment.
* The variable `DOTSOFTWARE_ROOT_DIR` has the same value on every host.

Suppose for example you builded Perl version 5.18.1 on _host1.example.com_, then
you install many Perl modules: yes, this can take time, specially for running all tests.

When you installation is complete, you can package your result

    $ cd $DOTSOFTWARE_ROOT_DIR/Perl
    $ mkdir packages
    $ tar czf perl-5.18.1.tar.gz perl-5.18.1/
    $ mv perl-5.18.1.tar.gz packages/

If you imagine you could replicate the installation just unpackaging it in many
servers, you will agree that it is a big amount of time saved.

To install the package just login on another machine,
for instance _host2.example.com_, get the package and uncompress it.

    $ cd $DOTSOFTWARE_ROOT_DIR/Perl
    $ mkdir packages
    $ scp user@host1.example.com:$DOTSOFTWARE_ROOT_DIR/Perl/packages/perl-5.18.1.tar.gz packages
    $ tar xzf packages/perl-5.18.1.tar.gz
    $ rm current 2> /dev/null
    $ ln -s perl-5.18.1 current

# Info

* __Author    :__ [G. Casati](https://github.com/fibo)
* __Repository:__ the repo of this software is hosted [here](https://github.com/fibo/.software)
* __License   :__ [MIT](http://fibo.mit-license.org/)

