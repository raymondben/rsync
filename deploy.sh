#!/bin/bash
set -o errexit -o nounset
addToDrat(){
  PKG_REPO=$PWD

  cd ..
  git clone https://$GH_TOKEN@github.com/inwtlab/drat.git
  git config user.name "Travis CI"
  git config user.email "sebastian.warnholz@inwt-statistics.de"
  git config --global push.default simple

  cd drat/docs
  Rscript -e "drat::insertPackage('$PKG_REPO/$PKG_TARBALL', \
    repodir = '.', \
    commit='Travis update: build $TRAVIS_BUILD_NUMBER')"
  git push 2> /tmp/err.txt

}
addToDrat
