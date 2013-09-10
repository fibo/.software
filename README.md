.software
=========

build &amp; install software locally
# Installation

Just go to your home dir and clone this repo.

    cd
    git clone https://github.com/fibo/.software.git

Load .software in your environment, for example

    echo 'source $HOME/.software/init.sh' >> .bash_profile

# Configuration

I recommend to create a branch named as your machine.

    cd ~/.software
    git checkout -b host123.example.org

Then merge branches related to software you need installed, for example

    git merge Node

# How it works

Every branch adds an omonym folder containing installation scripts and
configuration, for instance

    $ ls $HOME/.software/Node
    0_get
    1_build
    profile
    _sources_uri

# Usage

`.software` has only one feature: install software !

It is implemented by a bash function named .software the takes only one
parameter: what you want to install, for example

    .software Node

This will execute all the scripts in $HOME/.software/Node folder.

