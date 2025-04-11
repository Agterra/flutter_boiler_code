# Starter Pack flutter

Check the [changelog](changelog.md) to see the latest available tag.

This starter pack aims to help initiate a project faster, without including
depreciations.

# Requirements

- fvm
- gnu make

# How-To

This starter pack comes with a Makefile with helpful commands. Simply clone it,
and **specify the target directory** !

## init

Run `fvm flutter create .` (or platforms of your choice)

When creating the project, just run `make init`. This will setup `fvm` with the
latest stable flutter version for `fvm` and pin it, create the flutter project
with latest platform configuration files as well as a pack of packages we use in
every app. It will also init the git repo.

## setup

> Can be run multiple time

> You retrieve an existing project created with the starter pack

When you retrieve this already-initialized projet, just run `make setup` to
install the specified flutter version with `fvm` and get the packages.

## generate

> You want to generate files with builder

Run `make generate`

## localization

> You want to generate localizations

Run `make localization`

## clean

> You want to clean the project and regenerate generated files

Run `make clean`
