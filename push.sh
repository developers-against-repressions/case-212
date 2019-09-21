#!/bin/sh

setup_git() {
  git config --global user.email "bot@github.com"
  git config --global user.name "Github Bot"
}

git_commit_readme() {
  git add README.md
  git commit --message "README.md updated"
}

git_push() {
  git checkout -b master
  git remote remove origin
  git remote add origin https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git
  git push origin HEAD
}

setup_git
git_commit_readme
git_push