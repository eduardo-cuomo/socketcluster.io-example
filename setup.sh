#!/usr/bin/env bash

set -ex

nvm install

[ -d scc-state ]       || git clone https://github.com/SocketCluster/scc-state      scc-state
[ -d scc-broker ]      || git clone https://github.com/SocketCluster/scc-broker     scc-broker
[ -d sc-redis-broker ] || git clone https://github.com/rapidops/sc-redis-broker.git sc-redis-broker

( cd scc-state
  yarn install
)

( cd scc-broker
  yarn install
)

( cd sc-redis-broker
  yarn install
)
