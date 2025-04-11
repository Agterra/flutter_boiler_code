# Starter Pack flutter

Check the [changelog](changelog.md) to see the latest available tag.

This starter pack aims to help initiate a project faster, without including depreciations.

# Requirements
- fvm
- gnu make

# How-To

This starter pack comes with a Makefile with helpful commands.
Simply clone it, and **specify the target directory** !

```
git clone git@git.orkester.fr:flutter/starter-pack.git my_new_project
```

## init

> /!\ Run **once** /!\

> You want to create a new flutter project

example:
```
make init GIT=git@git.repo.fr:/myproject.git
```

or:
```
make init
```

When creating the project, just run `make init`. This will setup `fvm` with the latest stable flutter version for `fvm` and pin it, create the flutter project with latest platform configuration files as well as a pack of packages we use in every app. It will also init the git repo.

## setup

> Can be run multiple time

> You retrieve an existing project created with the starter pack

When you retrieve this already-initialized projet, just run `make setup` to install the specified flutter version with `fvm` and get the packages.

## generate

> You want to generate files with builder

Run `make generate`

## localization

> You want to generate localizations

Run `make localization`

## clean

> You want to clean the project and regenerate generated files

Run `make clean`

# Roadmap

You can see the changelogs [here](changelog.md) with the latest available tag.

- Add default envs flavors (dev, staging, preprod, prod)
- Add mkdocs page (low prio)

```
lib/
    app/                          <--- application layer
        pages/                        <-- pages or screens
          login/                        <-- some page in the app
            login.state.dart         <-- login controller extends `Controller`
            login.viewmodel.dart          <-- login presenter extends `Presenter`
            login.view.dart               <-- login view, 2 classes extend `View` and `ViewState` resp.
        widgets/                      <-- custom widgets
        utils/                        <-- utility functions/classes/constants
        navigator.dart                <-- optional application navigator
    data/                         <--- data layer
        repositories/                 <-- repositories (retrieve data, heavy processing etc..)
          data_auth_repo.dart           <-- example repo: handles all authentication
        helpers/                      <-- any helpers e.g. http helper
        constants.dart                <-- constants such as API keys, routes, urls, etc..
    core/                         <--- device layer
        repositories/                 <--- repositories that communicate with the platform e.g. GPS
        utils/                        <--- any utility classes/functions
    domain/                       <--- domain layer (business and enterprise) PURE DART
        entities/                   <--- enterprise entities (core classes of the app)
          user.dart                   <-- example entity
          manager.dart                <-- example entity
        usecases/                   <--- business processes e.g. Login, Logout, GetUser, etc..
          login.use_case.dart          <-- example usecase extends `UseCase` or `CompletableUseCase`
        repositories/               <--- abstract classes that define functionality for data and device layers
    main.dart                     <--- entry point
```