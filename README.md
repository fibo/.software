
.software
=========

> build & install software locally

Give it a try or [![Show me a Demo at Codio](https://codio-public.s3.amazonaws.com/sharing/demo-in-ide.png)](https://codio.com/fibo/dotsoftware).

## Quick start

For the impatient, just copy and paste the following lines in your bash prompt

```bash
# get latest .software
cd
git clone https://github.com/fibo/.software.git
# source it in your profile and in current session
[ -f ~/.bash_profile ] && grep 'source ~/.software/etc/profile' ~/.bash_profile || echo 'source ~/.software/etc/profile' >> ~/.bash_profile && source ~/.software/etc/profile
# you are done!
```

Give it a try, launch

```bash
$ .software_install Node
```

## Motivation

> Why install software locally?

If you have root rights or sudo with a package manager, __don't use me!__.

But, sometimes you are in one of the following scenarios

* your host is too old, without vendor support
* you have not root rights, and you need to keep your software update
* you need to compile and customize your builds
* you want to compile from sources you trust
* you want to try new releases without waiting until they are packaged
* you are a nerd
* you are a nerd, and it is saturday night

## Usage

*.software* has only one feature: installing software locally!

It is implemented by a bash function named `.software_install` that takes only one parameter: what you want to install.
For example

```bash
$ .software_install Foo
```

Typing *.software_install* in your bash prompt, and hitting <kbd>TAB</kbd> will autocomplete with available software, i.e. *~/.software/etc* subfolders.

## Requirements

Please note that *.software* supports only Linux, but most of the features should work on many other Unix-like systems, like BSD and Darwin with no or minor modifications.
In order to run, *.software* requires bash, tar, gzip, find and wget. Other requirements are those needed by software builds: make, gcc, etc.

## Installation

### Get it

Just go to your home dir and clone this repo.

```bash
$ cd
$ git clone https://github.com/fibo/.software.git
```

If you don't have git installed you can try the following commands

```bash
$ cd
$ wget --no-check-certificate https://github.com/fibo/.software/archive/master.zip
$ unzip master
$ mv .software-master .software
$ rm master
```

### Set your environment

The following command will add `source ~/.software/etc/profile` to your *.bash_profile* **only once** and load *.software* features in your current session.

```bash
$ [ -f ~/.bash_profile ] && grep 'source ~/.software/etc/profile' ~/.bash_profile || echo 'source ~/.software/etc/profile' >> ~/.bash_profile && source ~/.software/etc/profile
```

Otherwise you can add manually these lines to your *.bash_profile*. Note that if you are using *.software* from a graphical environment rather than a remote server login shell, you should use *.bashrc* file instead.

```bash
################################################################################
### .software config start

##[optional]
#
# Set .software target dir, defaults to "~/.software".
#
##
# export DOTSOFTWARE_ROOT_DIR=/path/to/your/software/installation/dir

##[required]
# Init .software
##
source ~/.software/etc/profile

### end .software config
################################################################################
```

#### DOTSOFTWARE_ROOT_DIR

*.software* uses enviroment variable `DOTSOFTWARE_ROOT_DIR` to know the dir where all your software will be installed.

It defaults to *~/.software* dir.

You maybe want to edit it when

* you have not enough space in your home dir
* you want to install in a dir common to many users like */usr/local* or */opt*.

Note that *.software* by default do not download sources if they are already in folder *$DOTSOFTWARE_ROOT_DIR/src*.
This information can be useful when you need to install software without an Internet connection.

Instead of setting a `DOTSOFTWARE_ROOT_DIR` variable, another choice is to create a symbolic link from your */dotsoftware/root/dir* to *~/.software/* dir.
For example on my [Codio box][1], since default working folder is *~./workspace* I did

```bash
$ ln -s ~/workspace/ ~/.software
```

Everything works like a charm!

## Folder structure

### ~/.software/etc/installrc.d/Foo

Software _Foo_ has its homonym file in folder *~/.software/etc/installrc.d*.

It defines env vars needed for installation. It **must contain** at least `SOURCES_URI`.

For example, _Wget_ contains

```bash
SOURCES_URI=http://ftp.gnu.org/gnu/wget/wget-${WGET_VERSION}.tar.gz
```

It can also be used to override functions used by *.software_install*

	_get_sources
	_read_sources_filename
	_read_current_version_dir
	_extract
	_build

For example, _Perl_ contains

```bash
SOURCES_URI=http://www.cpan.org/src/5.0/perl-${PERL_VERSION}.tar.gz

function _build() {
	cd $CURRENT_VERSION_DIR
	./Configure -des \
		-Dprefix=$DOTSOFTWARE_ROOT_DIR \
		-Dscriptdir=$DOTSOFTWARE_ROOT_DIR/bin \
		&& make test \
		&& make install
}
```

### ~/.software/etc/versions

Contains the list of software with corresponding version: **edit it** according to your needs.

### ~/.software/etc/profile

Implements the *.software_install* function.

## Packaging software

*.software* installs software locally downloading and compiling sources. This process can be time and cpu consuming, so, if you have two or more similar machines is not that difficult to build only once, then package your result and installing it on other hosts.
The requirement are

* The hosts has the same system software (OS, kernel, etc) and environment.
* The variable `DOTSOFTWARE_ROOT_DIR` has the same value on every host. Note that, using default value implies that users has the same name.

If you are using default *.software* configuration you could launch

```bash
$ cd
$ tar czf dotsoftware.tar.gz .software/
$ scp dotsoftware.tar.gz host1.example.com:~
$ ssh host1.example.com tar xzf dotsoftware.tar.gz
$ ssh host1.example.com rm dotsoftware.tar.gz
```

  [1]: https://codio.com/fibo/dotsoftware "Codio Box"

