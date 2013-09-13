	.software
=========

build & install software locally

# Repository

The repo of this software is hosted [here](https://github.com/fibo/.software).

# Usage

`.software` has only one feature: installing software locally !

It is implemented by a bash function named `.software_install` the takes only
one parameter: what you want to install, for example

    .software_install Foo

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

# Installation

## Get it

Just go to your home dir and clone this repo.

    cd
    git clone https://github.com/fibo/.software.git

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

## Create local branch

Create a local branch named `local`.

    cd ~/.software
    git checkout -b local

Its purpouse is to track all software actually installed on your machine, and
keep the `master branch` clean.

# Usage

## Add software

From your `branch local` merge branches related to software you need to install

    git merge Foo

Then install it

    .software_install Foo

This will prepare your env and launch the `~/.software/Foo/install.sh` script.

Note that you have to add manually a

    source ~/.software/Foo/profile

line to your `.bash_profile`.

## Conventions

Software Foo has its own branch Foo that is checkout from master and adds a Foo folder.

Foo folder contains the following files:

* installrc: exports env vars needed for installation, like `SOURCES_URI`
* install.sh: is launched by `.software_install` function and performes installation, does not work by its own
* profile: it is sourced by your `.bash_profile`

Feel free to customize, add, delete branches according to your needs, but,
really recommend that you keep the following branch model and conventions.

(suppose you want to install softwares Foo, Bar, Quz)

* master branch -> Foo branch [ -> Foo-x.y.z branch ]
* Foo, Bar, Quz branches -> local branch

The master branch contains the following files:

* README.md: this file
* init.sh: implements `.software_install` function, it is sourced by your `.bash_profile`
* dev-utils.sh: a set of helpers to maintain repository

The local branch is the result of merging Foo, Bar, Quz branches.

Branch Foo-x.y.z, if any, is a checkout from Foo and represents a specific version.

