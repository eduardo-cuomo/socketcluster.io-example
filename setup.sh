#!/usr/bin/env bash

set -ex

if ! type nvm >/dev/null 2>&1 ; then
  nvm install
fi

_install() {
  if type yarn >/dev/null 2>&1 ; then
    yarn install
  else
    npm install
  fi
}

[ -d scc-state ]       || git clone https://github.com/SocketCluster/scc-state      scc-state
[ -d scc-broker ]      || git clone https://github.com/SocketCluster/scc-broker     scc-broker
[ -d sc-redis-broker ] || git clone https://github.com/rapidops/sc-redis-broker.git sc-redis-broker

( cd scc-state
  _install
)

( cd scc-broker
  _install
)

( cd sc-redis-broker
  _install
)
