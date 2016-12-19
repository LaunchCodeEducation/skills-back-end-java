#!/bin/sh

git push origin gh-pages
couscous deploy
git pull origin gh-pages
