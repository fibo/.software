dot software
============

> build & install software locally with **dot**software

[Usage](#usage) | [Installation](#installation) | [Software list](#software-list)

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
$ .software_install Golang
```

If you want to try it without installing, push this button to [![Show me a Demo at Codio](https://codio-public.s3.amazonaws.com/sharing/demo-in-ide.png)](https://codio.com/fibo/dotsoftware)

## Motivation

> Why install software locally?

If you have root rights or sudo with a package manager, **don't use me!**.

But, sometimes you are in one of the following scenarios

* your host is too old, without vendor support
* you have not root rights, and you need to keep your software up to date
* you want to compile from sources you trust
* you want to try new releases without waiting until they are packaged
* you are a *nerd*
* you are a *nerd*, and it is Saturday night
* ok, seriously: you are a *nerd* and you want to try a new software, avoiding to mess with your system binaries

## Usage

*.software* has only one feature: installing software locally!

It is implemented by a bash function named `.software_install` that takes only one parameter: what you want to install.

For example

```bash
$ .software_install Foo
```

Typing *.software_install* in your bash prompt, and hitting <kbd>TAB</kbd> will autocomplete with available software.
Take a look to [Software list](#software-list), which includes for example [Perl](#perl), [Node](#node), [Golang](#golang), [Ruby](#ruby).

## Installation

### Requirements

Please note that *.software* supports only Linux, but could work on many other Unix-like systems, like [BSD](http://en.wikipedia.org/wiki/Berkeley_Software_Distribution) and [Darwin](http://en.wikipedia.org/wiki/Darwin_%28operating_system%29).
In order to run, *.software* requires bash, [Tar](#tar), [Gzip](#gzip), [Grep](#grep), [Findutils](#findutils) and [Wget](#wget).
Other requirements are those needed by software builds: [Make](#make), [gcc](#gcc), etc.

I am working on zsh compatibility, feedbacks are welcome.

### Get it

Just go to your home directory and clone this repository.

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

Otherwise you can add manually these lines to your *.bash_profile*.
Note that if you are using *.software* from a graphical environment rather than a remote server login shell, you should edit *.bashrc* file instead.

```bash
###############################################################################
### .software config start

# Set .software target dir, defaults to "~/.software".
# export DOTSOFTWARE_ROOT_DIR=/path/to/your/software/installation/dir

# Init .software
source ~/.software/etc/profile

### .software config end
###############################################################################
```

#### DOTSOFTWARE_ROOT_DIR

*.software* uses enviroment variable `DOTSOFTWARE_ROOT_DIR` to know the dir where all your software will be installed.

It defaults to *~/.software*.

You maybe want to edit it when

* you have not enough space in your home directory.
* you want to install in a directory common to many users like */usr/local* or */opt*.

Note that *.software* by default do not download sources if they are already in folder *$DOTSOFTWARE_ROOT_DIR/src*.
This information can be useful when you need to install software without an Internet connection.

Instead of setting a `DOTSOFTWARE_ROOT_DIR` variable, another choice is to create a symbolic link from your */dotsoftware/root/dir* to *~/.software/* dir.
For example on my [Codio box][1], since default working folder is *~./workspace* I launched

```bash
$ ln -s ~/workspace/ ~/.software
```

## Software list

### [BitchX](http://bitchx.sourceforge.net/)

> version 1.2.1

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [ctags](http://ctags.sourceforge.net/)

> version 5.8

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [cURL](http://curl.haxx.se/)

> version 7.41.0

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Dos2Unix](http://dos2unix.sourceforge.net/)

> version 7.1

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Expat](http://expat.sourceforge.net/)

> version 2.1.0

Build depends on:
* [gcc](#gcc)
* [Make](#make)
* [Perl](#perl)
* [Python](#python)

### [Expect](http://expect.sourceforge.net/)

> version 5.45

Build depends on:
* [gcc](#gcc)
* [Make](#make)
* [Tcl](#tcl)

### [Findutils](http://www.gnu.org/software/findutils/)

> version 4.4.2

It is a *.software* dependency.

Install it with a package manager:

* `# apt-get install findutils`

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Fontconfig](http://www.freedesktop.org/wiki/Software/fontconfig/)

> version 2.11.93

Build depends on:
* [gcc](#gcc)
* [Make](#make)
* [Expat](#expat)
* [FreeType](#freetype)
* [pkg-config](#pkg-config)

### [FreeType](http://www.freetype.org/)

> version 2.5.5

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### g++

Build not supported.

Install it with a package manager:

* `# apt-get install c++`

### gcc

Build not supported.

Install it with a package manager:

* `# apt-get install gcc`

### [Git](https://git-scm.com/)

> version 2.3.5

Build depends on:
* [gcc](#gcc)
* [Make](#make)
* [Perl](#perl)
* [Python](#python)

### [git-extras](https://github.com/tj/git-extras)

> version 2.2.0

Build depends on:
* [Make](#make)

### [Golang](https://golang.org/)

> version 1.4.2

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Graphviz](http://www.graphviz.org/)

> version 2.38.0

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Grep](http://www.gnu.org/software/grep/)

> version 2.21

It is a *.software* dependency.

Install it with a package manager:

* `# apt-get install grep`

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Gzip](http://www.gnu.org/software/gzip/)

> version 1.6

Install it with a package manager:

* `# apt-get install gzip`

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Lua](http://www.lua.org/)

> version 5.3.0

Build depends on:
* [gcc](#gcc)
* [Make](#make)
* [Readline](#readline)

### [libxml2](http://www.xmlsoft.org/)

> version 2.9.0

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Make](http://www.gnu.org/software/make/)

> version 3.82

Install it with a package manager:

* `# apt-get install make`

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Ncurses](http://www.gnu.org/software/ncurses/)

> version 5.9

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Netcat](http://netcat.sourceforge.net/)

> version 0.7.1

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Node](https://nodejs.org/)

> version 4.0.0

Build depends on:
* [g++](#g++)
* [Make](#make)
* [Python](#python)

### [OpenSSL](https://www.openssl.org/)

Build not supported.

Install it with a package manager:

* `# apt-get install openssl libssl libssl-dev`

### [Readline](http://www.gnu.org/software/readline/)

Build not supported.

Install it with a package manager:

* `# apt-get install libreadline-dev`
* `# yum install readline-devel`

### [patch](http://www.gnu.org/software/patch/)

> version 2.7

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Perl](http://www.perl.org/)

> version 5.22.0

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [pkg-config](http://www.freedesktop.org/wiki/Software/pkg-config/)

> version 0.18

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Python](https://www.python.org/)

> version 2.7.9

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Redis](http://redis.io/)

> version 3.0.1

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [rsync](https://rsync.samba.org/)

> version 3.1.1

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Ruby](https://www.ruby-lang.org/)

> version 2.1.6

Build depends on:
* [gcc](#gcc)
* [Make](#make)
* [OpenSSL](#openssl)
* [libxml2](#libxml2)
* [patch](#patch)

Here version may be not the latest cause it is up to date with [GitHub Pages Dependency versions](https://pages.github.com/versions/).

### [sed](http://www.gnu.org/software/sed/)

> version 4.2.2

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Tar](http://www.gnu.org/software/tar/)

> version 1.28

It is a *.software* dependency.

Install it with a package manager:

* `# apt-get install tar`

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Tcl](http://www.tcl.tk/)

> version 8.6.4

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Wget](http://www.gnu.org/software/wget/)

> version 1.16

It is a *.software* dependency.

Install it with a package manager:

* `# apt-get install wget`

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [xz](http://tukaani.org/xz/)

> version 5.0.5

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [zlib](http://www.zlib.net/)

> version 1.2.8

Build depends on:
* [gcc](#gcc)
* [Make](#make)

### [Zsh](http://www.zsh.org/)

> version 5.0.7

Build depends on:
* [gcc](#gcc)
* [Make](#make)
* [Ncurses](#ncurses)

## Folder structure

### ~/.software/etc/installrc.d/

Software _Foo_ has its homonym file in folder *~/.software/etc/installrc.d*.

It defines environment variables needed for installation. It **must contain** at least `SOURCES_URI`.

For example, _Wget_ file contains

```bash
SOURCES_URI=http://ftp.gnu.org/gnu/wget/wget-${VERSION}.tar.gz
```

It can also be used to override functions used by *.software_install*

	_get_sources
	_read_sources_filename
	_read_current_version_dir
	_extract
	_build

For example, _Perl_ file contains

```bash
SOURCES_URI=http://www.cpan.org/src/5.0/perl-${VERSION}.tar.gz

function _build() {
	cd $CURRENT_VERSION_DIR
	./Configure -des \
		-Dprefix=$DOTSOFTWARE_ROOT_DIR \
		-Dscriptdir=$DOTSOFTWARE_ROOT_DIR/bin \
		&& make test \
		&& make install
}
```

### ~/.software/etc/profile

Implements the *.software_install* function.

### ~/.software/README.md

This file, contains also software versions. Every software must have an homonym section in this file
where version number is in the second row, like this

```
### [Foo](http://url-of-foo-homepage.xxx)

> version 1.2.3
```

## Packaging software

*.software* installs software locally downloading and compiling sources. This process can be time and cpu consuming, so, if you have two or more similar machines is not that difficult to build only once, then package your result and installing it on other hosts.
The requirement are

* The hosts has the same system software (OS, kernel, etc) and environment.
* The variable [DOTSOFTWARE_ROOT_DIR](#dotsoftware_root_dir) has the same value on every host. Note that, using default value implies that users has the same name.

If you are using default *.software* configuration you could launch

```bash
$ cd
$ tar czf dotsoftware.tar.gz .software/
$ scp dotsoftware.tar.gz host1.example.com:~
$ ssh host1.example.com tar xzf dotsoftware.tar.gz
$ ssh host1.example.com rm dotsoftware.tar.gz
```

  [1]: https://codio.com/fibo/dotsoftware "Codio Box"

