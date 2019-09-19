#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

git_commit_readme() {
  git checkout -b temp
  git add README.md
  git add signed/
  git commit --message "Add a signature. Travis build: $TRAVIS_BUILD_NUMBER"
}

git_push() {
  git remote add origin https://${GH_TOKEN}@github.com/developers-against-repressions/case-212.git > /dev/null 2>&1
  git push --quiet --set-upstream origin temp
}

setup_git
git_commit_readme
git_push
