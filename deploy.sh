#!/bin/bash
rm -rf public || exit 0;
mkdir public;
hexo generate;
( cd public
 git init
 git config user.name "tbfe"
 git config user.email "tbfe-ci@baidu.com"
 git add .
 git commit -m "Deployed to Github Pages"
 git push --force "https://${GH_TOKEN}@${GH_REF}" master:gh-pages
)
