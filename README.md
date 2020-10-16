# Introduction

This is a collection of dotfiles. The bootstrap process:

* Install SSH key.
* Install a handful of tools and prepare directories:

        curl -fsSL https://raw.githubusercontent.com/copperlight/dotfiles/master/bootstrap.sh | /bin/bash

* Initialize the dotfiles:

        $HOME/git/github/copperlight/dotfiles/init-dots.sh

# Configuration Features

## Secrets and Snippets

Checking secrets into source control is no good, but it is useful to have secrets configured as environment
variables. The shell profile supports sourcing secrets and snippets from the `$HOME/.dotfiles.d` directory.

## vim

Basic vim configuration that provides numbers, rulers and tab behavior.

## zsh

Main shell profile. Just the basics, nothing fancy.
