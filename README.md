# script-zippey

## Introduction

[Zippey](https://bitbucket.org/sippey/zippey/src/master/) is a tool developed by Sippey Fun Lab that enables Git to handle zip-based files (in this case Freecad's `.FCStd` format) as text rather than binary, simplifying version control. The script is under the BSD 3-Clause License, as detailed in the header of the `zippey.py` file.

## Description

This repository illustrates the way Zippey is used across various repositories in the organization, allowing FreeCAD's `.FCStd` files to be processed by Git as plain text content.

If you clone this repository you can see it in action by running the `test_script.sh`, it will simulate a commit/checkout sequence and compare the resulting file to the original (there should be no difference obviously). It doesn't requires any arguments and can be run as such :

```bash
.\test_script.sh
```

## Getting Started

### Existing repository

#### 1. Filter setup

To work with an existing repository already using Zippey you must define the filter and diff attribute in git's setting file, either globally or per repository. This is necessary because otherwise git will retrieve uncompressed files that FreeCAD won't understand.

- Globally

```bash
git config --global filter.zippey.smudge "scripts/zippey/zippey.py d"
git config --global filter.zippey.clean "scripts/zippey/zippey.py e"
git config --global diff.zip.textconv "unzip -c -a"
```

- Locally

```bash
git config filter.zippey.smudge "scripts/zippey/zippey.py d"
git config filter.zippey.clean "scripts/zippey/zippey.py e"
git config diff.zip.textconv "unzip -c -a"
```

### New repository

#### 1. Installation and script location

There are no dependencies and no specific installation steps, the script only uses standard Python libraries. It can be copied as-is from this repository.

The filter assumes that the script's location in the repo is `scripts/zippey/zippey.py` for consistency across repositories.

#### 2. Filter setup

The filter can be defined in git's setting file, either globally or per repository.

- Globally

```bash
git config --global filter.zippey.smudge "scripts/zippey/zippey.py d"
git config --global filter.zippey.clean "scripts/zippey/zippey.py e"
git config --global diff.zip.textconv "unzip -c -a"
```

- Locally

```bash
git config filter.zippey.smudge "scripts/zippey/zippey.py d"
git config filter.zippey.clean "scripts/zippey/zippey.py e"
git config diff.zip.textconv "unzip -c -a"
```

#### 3. Filter declaration

The filter and diff attribute can then be declared in the `.gitattributes` file for the relevant extension

```
*.FCStd filter=zippey
*.FCStd diff=zip
```

#### 4. Additional considerations

It is also a good idea to add the `.FCStd1` extension in the `.gitignore` file as they are just backups and would only increase the commit's size unnecessarily.

```
*.FCStd1
```
