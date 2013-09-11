.software
=========

build &amp; install software locally

# Installation

Just go to your home dir and clone this repo.

    cd
    git clone https://github.com/fibo/.software.git

Add these lines to your .bash_profile

    source $HOME/.software/init.sh
    source $DOTSOFTWARE_HOME_DIR/*/profile

# Configuration

I recommend to create a branch named as your machine.

    cd ~/.software
    git checkout -b host123.example.org

Then merge branches related to software you need installed, for example

    git merge Node

# Usage

`.software` has only one feature: installing software !

It is implemented by a bash function named .software the takes only one
parameter: what you want to install, for example

    .software Node

