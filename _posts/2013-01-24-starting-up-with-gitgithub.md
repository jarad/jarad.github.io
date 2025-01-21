---
layout: post
title: "Starting up with Git/Github"
description: ""
category:
tags: [Git, Github, introduction]
---
{% include JB/setup %}

I have started using [Git](http://git-scm.com/) for version control and [Github](http://github.com/) to store the repositories. I have now recruited others to start using it and inevitably need to let them know the basics of how git/github works. So here is my attempt at introducing how to interact with git/github for those new to version control. I am not attempting to say why.

# Initializing the repository

Here's what we have to do once.

## What you have to do

- Go to <http://github.com>, sign up for an account, and let me know your username, e.g. mine is [jarad](http://jarad.github.io).
- Follow [these instructions](https://help.github.com/articles/set-up-git).

## What I have to do

I will create a repository on github, add you as a collaborator, and let you know the repository name (you will get an email too). Let's call this repository `foo'. 

## Getting started with the repository

Using terminal or the Github windows app, go to the directory where you want to store this repository and type
    mkdir foo
    cd foo
    git init
    git remote add origin git@github.com:jarad/foo.git
These instructions are meant for collaborators working on my repositories. Change 'foo' to whatever our repository is called. Then type
    git pull origin master
Unless I messed something up (and I probably have), this should have pulled down the current version of the files from the repository. 

# Working with the repository

## Start of a coding session

With any luck you now have the repository on your computer. Here is the workflow I use. When you sit down on your computer to do some coding in this repository, first type
    git pull origin master
so that the current version of the files are on your computer. 

## Adding a file or modifying an existing file

Suppose you wish to add or modify a file called 'file.txt'. Open up your favorite text editor, edit the file, save the file, and then type
    git add file.txt
    git commit -m "an informative message about what you changed/added/deleted"
Within git, a commit records the differences between the previous version and this version so that it is possible to go back to previous versions. The mantra is 
> commit early and often

## End of a coding session

When you are down working on the code for that session, type
    git push
This sends all your commits to the server repository on Github so that your collaborators all have access to it. Feel free to push more often, but you should probably make sure your code works before you do.

## Handy commands

It is often useful to know how what modifications you have made on your local computer. To find out use 
    git status
To remove a file
    git rm file.txt
This will remove file.txt from this and future commits, but the file will still exist in previous commits. This means that if the file really ends up being important, you can go back and get it.


# Problems

## Merge conflicts

When I started, I remember the most annoying thing was getting a merge conflict when you tried to run
    git pull origin master
This occurs when the version of a file on the server and your version are both offspring of a previous version. Typically this would occur when I did not end my session with a git push on, say, my home computer, and then tried to start modifying files on my work computer. I have now eliminated this problem by make sure to commit all my changes and push them to the server before I end my coding session. 

## 'no changes added to commit'

You forgot to add files to be committed. Use, e.g.
    git add file.txt
Then rerun your commit.

## Quickly undo a change

Sometimes, I start modifying a file and something doesn't work. Now I no longer want those changes. To quickly revert back to the previous commit, use
    rm file.txt
    git checkout file.txt




