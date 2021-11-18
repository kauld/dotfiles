#!/bin/bash
#init-git () {
    #rm -rf .git/
    #git init
    #rm .git/config
#}
    git add .
    git commit -m "Update" 
    #git push --all 
    git push --force --mirror
