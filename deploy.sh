#!/bin/bash
npm install
elm-package install --yes
npm run build
cd dist

git init
git config user.name "Travis CI"
git config user.email "inderps@users.noreply.github.com"
git add .
git commit -m "Travis deploy examples to gh-pages"
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages >/dev/null 2>&1
