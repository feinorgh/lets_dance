# lets_dance
Demo for TV4 Let's Dance API

Written by Pär Karlsson <feinorgh@gmail.com>

# Requirements

This demo requires:
* an internet connection
* a recent Perl installation (at least perl-5.10.x or above)
* Mojolicious (http://mojolicious.org/)
* node.js / npm

# Installation

Any platform supporting perl should be able to run this. Mojolicious comes
with very few dependencies, so with a little luck you should be able to
either install perl via perlbrew ( https://perlbrew.pl/ ) as is mentioned
on the Mojolicious site or use the package manager of your operating system.

It will probably work under Strawberry Perl and/or ActivePerl if you are on
Windows.

Most Linux-based OS:es come with a decent version of Perl, unless you are
running an older version of RedHat/CentOS (where breakage is expected).

Installing Mojolicious should be as easy as

```
cpan Mojolicious
```

When you have the necessary computing environment, checkout the code for
the "Let's Dance" application from github:

```
git clone git@github.com:feinorgh/lets_dance.git
```

Change directory into the 'lets_dance' folder and install the necessary
CSS/JavaScript modules via 'npm':

```
npm install
```

If everything has gone well, you should be able to start a development
environment by

```
morbo -v script/lets_dance
```

This will set up morbo to listen on port 3000 by default, so point your
web browser to the IP/URL of your host and you should be able to see
the page load. Logging is done into log/development.log.

Alternatively, you can use the hypnotoad preforking web server:

```
hypnotoad script/lets_dance
```

This will start a web server listening on port 8080. Logging is done to
log/production.log

Unit and integration tests can be run by

```
script/lets_dance test -v
```
