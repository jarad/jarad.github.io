---
layout: post
title: "Git Commits Finish the Sentence 'If this commit is accepted, it will ...'"
description: ""
category: [git]
tags: [git,commit,resources]
---

{% include JB/setup %}

I use git and 
[github.com](http://github.com/) for almost all of my work including
research 
[manuscripts](https://www.jarad.me/research/publications.html), 
[teaching content](https://www.jarad.me/courses/), and 
[my website](https://www.jarad.me/). 

When you use git (or any other version control software) and you make changes
to files, you need to record those changes in a 
[commit message](https://github.com/jarad/jarad.github.io/commits/master). 
These commit messages provide a brief summary of what changes have occurred
in the history of the files and can allow you to back in time to a previous 
version of the file. 
But the messages are only as useful if they are written well and therefore
it is important to have a process to write those commits. 

I found a [post by Chris Beams](https://chris.beams.io/posts/git-commit/) that
provides suggestions about how to write commit messages. 
The most important is that a commit message should finish the sentence

> If this commit is accepted, it will...

His post also has seven rules for writing commit messages. 
I'm repeating them here, but you should check out his post for more details
about each of these rules:

1. Separate subject from body with a blank line
1. Limit the subject line to 50 characters
1. Capitalize the subject line
1. Do not end the subject line with a period
1. Use the imperative mood in the subject line
1. Wrap the body at 72 characters
1. Use the body to explain *what* and *why* rather than *how*

So the caveat to finishing the above sentence is that the message should be
capitalized and should not end in a period. 

I work with enough researchers that use git and have no process for writing 
their commit messages that I'm hoping this will provide some guidance. 
