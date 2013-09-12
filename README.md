.software
=========

build & install software locally

# Installation

## Get it

Just go to your home dir and clone this repo.

    cd
    git clone https://github.com/fibo/.software.git

If you don't have git you should create a 

Add these lines to your `.bash_profile`

    # Set .software target dir, defaults to ~/opt
    # [optional]
    ##
    export DOTSOFTWARE_ROOT_DIR=/path/to/

    # Load .software
    # [required]
    ##
    source ~/.software/init.sh

    # Load .software profiles
    ##
    # source ~/.software/Node/profile
    # source ~/.software/Python/profile

## Add software

    cd ~/.software

# Usage

`.software` has only one feature: installing software !

It is implemented by a bash function named .software the takes only one
parameter: what you want to install, for example

    .software Foo

This will prepare your env and launch the `~/.software/Foo/install.sh` script.
Note that you should add a

    source ~/.software/Foo/profile

line lines to your `.bash_profile` after installation complete.

I recommend to create a branch named as your machine.

    cd ~/.software
    git checkout -b host123.example.org

Then merge branches related to software you need installed, for example

    git merge Foo

