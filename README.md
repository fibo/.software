.software
=========

build & install software locally

# Why install software locally ?

If you have root rights or sudo with a package manager, *don't use me!*.

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

This will prepare your env and launch the `~/.software/Foo/install.sh` script.

Note that you have to add manually a

    source ~/.software/Foo/profile

line to your `.bash_profile`.

# Installation

## Get it

Just go to your home dir and clone this repo.

    $ cd
    $ git clone https://github.com/fibo/.software.git

If you don' t have git installed you can try something like

    $ wget --no-check-certificate https://github.com/fibo/.software/archive/master.zip
    $ unzip master
    $ mv .software-master .software
    $ rm master

## Set your environment

Add these lines to your `.bash_profile`

    # Set .software target dir, defaults to ~/opt
    # [optional]
    ##
    # export DOTSOFTWARE_ROOT_DIR=/path/to/your/software

    # Init .software
    # [required]
    ##
    source ~/.software/init.sh

    # Load .software profiles
    ##
    # source ~/.software/Node/profile
    # source ~/.software/Python/profile

Load it if you want to use it in your current shell session

    $ source ~/.software/init.sh

# Environment

`.software` uses only one enviroment variable: `DOTSOFTWARE_ROOT_DIR`. It is the
dir where all your software will be installed, defaults to `~/opt`.

You maybe want to edit it, for example when

* you have not enough space in your home dir
* you want to install in a dir common to many users like `/usr/local` or `/opt`.


# Folder structure

`.software` folder contains the following files:

* README.md: this file
* init.sh: implements `.software_install` function, it is sourced by your `.bash_profile`

There is a folder for every software that can be installed.

Software Foo has its Foo folder and contains the following files:

* installrc: exports env vars needed for installation, like `SOURCES_URI`
* install.sh: is launched by `.software_install` function and performes
               installation, does not work by its own
* profile: it is sourced by your `.bash_profile`

Feel free to customize files according to your needs.

# Info

## Author

[G. Casati](https://github.com/fibo)

## Repository

The repo of this software is hosted [here](https://github.com/fibo/.software).

## License

[MIT](http://fibo.mit-license.org/)

