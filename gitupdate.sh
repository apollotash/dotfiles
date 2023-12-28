#!/bin/bash

#This script designed to update github repostories when they are updated on computer.


git status
git add .
git commit -m "Last update"


git remote add origin git@github.com:apollotash/dotfiles.git
git push -u origin master
