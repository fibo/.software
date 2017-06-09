dot software
============

> build & install software locally with **dot**software

[Quick start](#quick-start) |
[Usage](#usage) |
[Installation](#installation) |
[Software list](#software-list) |
[Folder structure](#folder-structure) |
[Packaging software](#packaging-software)

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

It is implemented by a bash function named `.software_install` that takes the software want to install as argument.

For example

```bash
.software_install Foo
```

Optionally, a custom version number can be passed as a second argument

```bash
.software_install Foo 2.3.4
```

Typing *.software_install* in your bash prompt, and hitting <kbd>TAB</kbd> will autocomplete with available software.
Take a look to [Software list](#software-list), which includes [Perl](#perl), [Node](#node), [Golang](#golang), [Ruby](#ruby) among others.

## Installation

### Requirements

Please note that *.software* supports Linux and OS X, but could work on other Unix-like systems, like [BSD](http://en.wikipedia.org/wiki/Berkeley_Software_Distribution).
In order to run, *.software* requires bash, [Tar](#tar), [Gzip](#gzip), [Grep](#grep), [Findutils](#findutils) and [Wget](#wget).
Other requirements are those needed by software builds: [Make](#make), [gcc](#gcc), etc.

### Get it

Just go to your home directory and clone this repository.

```bash
cd
git clone https://github.com/fibo/.software.git
```

If you don't have git installed you can try the following commands

```bash
cd
wget --no-check-certificate https://github.com/fibo/.software/archive/master.zip
unzip master
mv .software-master .software
rm master
```

### Set your environment

The following command will add `source ~/.software/etc/profile` to your *.bash_profile* **only once** and load *.software* features in your current session.

```bash
$ [ -f ~/.bash_profile ] && grep 'source ~/.software/etc/profile' ~/.bash_profile || echo 'source ~/.software/etc/profile' >> ~/.bash_profile && source ~/.software/etc/profile
```

Otherwise you can add manually these lines to your *.bash_profile*.
Note that if you are using *.software* from a graphical environment rather than a remote server login shell, you should edit *.bashrc* file instead.

```bash
##########################
### .software config start

# Set .software target dir, defaults to "~/.software".
# export DOTSOFTWARE_ROOT_DIR=/path/to/your/software/installation/dir

# Init .software
source ~/.software/etc/profile

### .software config end
########################
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

## Software list

<a name="autoconf"></a>

### [Autoconf](http://www.gnu.org/software/autoconf/autoconf.html)

Build not supported.

Install it with a package manager:

* `# apt-get install autoconf`

<a name="ctags"></a>

### [ctags](http://ctags.sourceforge.net/)

> version 5.8

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="curl"></a>

### [cURL](http://curl.haxx.se/)

> version 7.53.1

In order to support `POST` via https, it is builded `--with-ssl` configure flag.

Build depends on:

* [gcc](#gcc)
* [Make](#make)
* [OpenSSL](#openssl)

<a name="dos2unix"></a>

### [Dos2Unix](http://dos2unix.sourceforge.net/)

> version 7.1

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="expat"></a>

### [Expat](http://expat.sourceforge.net/)

> version 2.1.0

Build depends on:

* [gcc](#gcc)
* [Make](#make)
* [Perl](#perl)
* [Python](#python)

<a name="expect"></a>

### [Expect](http://expect.sourceforge.net/)

> version 5.45

Build depends on:

* [gcc](#gcc)
* [Make](#make)
* [Tcl](#tcl)

<a name="findutils"></a>

### [Findutils](http://www.gnu.org/software/findutils/)

> version 4.4.2

It is a *.software* dependency.

Install it with a package manager:

* `# apt-get install findutils`

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="g++"></a>

### g++

Build not supported.

Install it with a package manager:

* `# apt-get install g++`

<a name="gcc"></a>

### gcc

Build not supported.

Install it with a package manager:

* `# apt-get install gcc`

<a name="gettext"></a>

### [Gettext](https://www.gnu.org/software/gettext/)

Build not supported.

Install it with a package manager:

* `# apt-get install gettext`

<a name="git"></a>

### [Git](https://git-scm.com/)

> version 2.8.2

Build depends on:

* [gcc](#gcc)
* [Make](#make)
* [Autoconf](#autoconf)
* [cURL](#curl)
* [Expat](#expat)
* [Gettext](#gettext)
* [Perl](#perl)
* [Python](#python)

<a name="git-extras"></a>

### [git-extras](https://github.com/tj/git-extras)

> version 2.2.0

Build depends on:

* [Make](#make)

<a name="golang"></a>

### [Golang](https://golang.org/)

> version 1.6

Build depends on:

* [gcc](#gcc)
* [Make](#make)

*Golang* needs environment variables

* `GOROOT` which is set to `$DOTSOFTWARE_ROOT_DIR/opt/golang`
* `GOPATH` which is set to `$DOTSOFTWARE_ROOT_DIR/opt/gopath`

<a name="graphviz"></a>

### [Graphviz](http://www.graphviz.org/)

> version 2.38.0

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="grep"></a>

### [Grep](http://www.gnu.org/software/grep/)

> version 2.21

It is a *.software* dependency.

Install it with a package manager:

* `# apt-get install grep`

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="gzip"></a>

### [Gzip](http://www.gnu.org/software/gzip/)

> version 1.6

Install it with a package manager:

* `# apt-get install gzip`

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="lua"></a>

### [Lua](http://www.lua.org/)

> version 5.3.0

Build depends on:

* [gcc](#gcc)
* [Make](#make)
* [Readline](#readline)

<a name="libxml2"></a>

### [libxml2](http://www.xmlsoft.org/)

> version 2.9.0

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="make"></a>

### [Make](http://www.gnu.org/software/make/)

> version 3.82

Install it with a package manager:

* `# apt-get install make`

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="netcat"></a>

### [Netcat](http://netcat.sourceforge.net/)

> version 0.7.1

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="node"></a>

### [Node](https://nodejs.org/)

> version 8.1.0

Node version above is latest **LTS / Stable**.

Build depends on:

* [g++](#g)
* [Make](#make)
* [Python](#python)

<a name="openssl"></a>

### [OpenSSL](https://www.openssl.org/)

Build not supported.

Install it with a package manager:

* `# apt-get install openssl libssl-dev`
* `# yum install openssl-devel`

<a name="readline"></a>

### [Readline](http://www.gnu.org/software/readline/)

Build not supported.

Install it with a package manager:

* `# apt-get install libreadline-dev`
* `# yum install readline-devel`

<a name="squid"></a>

### [Squid](http://www.squid-cache.org/)

> version 3.5.11

Build depends on:

* [g++](#g)
* [gcc](#gcc)
* [Make](#make)

<a name="patch"></a>

### [patch](http://www.gnu.org/software/patch/)

> version 2.7

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="perl"></a>

### [Perl](http://www.perl.org/)

> version 5.20.3

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="python"></a>

### [Python](https://www.python.org/)

> version 2.7.9

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="postgresql"></a>

### [PostgreSQL](http://www.postgresql.org/)

> version 9.4.5

Build depends on:

* [gcc](#gcc)
* [Make](#make)
* [Readline](#readline)
* [zlib](#zlib)

Install requirements with a package manager:

* `# apt-get install make gcc libreadline-dev zlib1g-dev`

Variable `PGDATA` defines the directory where PostgreSQL stores data and configuration.
It defaults to `$DOTSOFTWARE_ROOT_DIR/opt/pgsql/data`.

On build, commands `initdb` and `createdb` are launched: this means that
database instance is initialized and a database named as your unix user is created.
Set variable `PGDATABASE` in your environment to customize database name.

Common actions are:

* **Stop** database: `stop_postresql`
* **Start** database: `start_postgresql`
* **Connect** to database: `psql`
* **Reload** configuration: `pg_ctl reload`

Configuration files can be found in `$PGDATA` directory.
For example, to enable connections to all users and databases from
IP 10.20.30.40, to a PostgreSQL instance running on an host with an IP 1.2.3.4,

edit $PGDATA/postgresql.conf

```
listen_addresses = '1.2.3.4'
```

and $PGDATA/pg_hba.conf

```
host    all    all    10.20.30.40/32    trust
```

then launch

```
pg_ctl reload
```

To build a [Amazon Redshift](https://aws.amazon.com/redshift/) compatible version launch

```
.software_install PostgreSQL 8.0.2
```

<a name="redis"></a>

### [Redis](http://redis.io/)

> version 3.2.8

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="rsync"></a>

### [rsync](https://rsync.samba.org/)

> version 3.1.2

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="ruby"></a>

### [Ruby](https://www.ruby-lang.org/)

> version 2.3.1

Build depends on:

* [gcc](#gcc)
* [Make](#make)
* [OpenSSL](#openssl)
* [libxml2](#libxml2)
* [patch](#patch)

Here version may be not the latest cause it is (manually) up to date with [GitHub Pages Dependency versions](https://pages.github.com/versions/).
However you can install another version, for example with

```
.software_install Ruby 2.1.7
```

<a name="sed"></a>

### [sed](http://www.gnu.org/software/sed/)

> version 4.2.2

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="tar"></a>

### [Tar](http://www.gnu.org/software/tar/)

> version latest

It is a *.software* dependency.

Install it with a package manager:

* `# apt-get install tar`

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="tcl"></a>

### [Tcl](http://www.tcl.tk/)

> version 8.6.4

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="wget"></a>

### [Wget](http://www.gnu.org/software/wget/)

> version 1.18

It is a *.software* dependency.

Install it with a package manager:

* `# apt-get install wget`

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="xz"></a>

### [xz](http://tukaani.org/xz/)

> version 5.0.5

Build depends on:

* [gcc](#gcc)
* [Make](#make)

<a name="zlib"></a>

### [zlib](http://www.zlib.net/)

> version 1.2.8

Build depends on:

* [gcc](#gcc)
* [Make](#make)

Install it with a package manager:

* `# apt-get install zlib1g-dev`
* `# yum install zlib-devel`

## Folder structure

### ~/.software/etc/installrc.d/

Software _Foo_ has its homonym file in folder *~/.software/etc/installrc.d*.

It defines environment variables needed for installation. It **must contain** at least `SOURCES_URI`.

For example, _Wget_ file contains

```bash
SOURCES_URI=http://ftp.gnu.org/gnu/wget/wget-${VERSION}.tar.gz
```

It can also be used to override functions used by *.software_install*, which are

  * get_sources
  * read_sources_filename
  * read_current_version_dir
  * extract
  * build

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

### ~/.software/etc/profile.d/

Contains profile files for every software, where needed.

### ~/.software/README.md

This file, contains also software versions. Every software must have an homonym section in this file
where version number is in the second row, like this

```
### [Foo](http://url-of-foo-homepage.xxx)

> version 1.2.3
```

## Packaging software

*.software* installs software locally downloading and compiling sources.
This process can be time and cpu consuming, so, if you have two or more similar machines is not that difficult to build only once, then package your result and installing it on other hosts.
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

