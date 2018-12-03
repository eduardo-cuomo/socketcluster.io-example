# Run: . ./setup.sh

( set -ex

  if ! type nvm >/dev/null 2>&1 ; then
    nvm install
  fi

  _install() {
    ( cd "${1}"
      if type yarn >/dev/null 2>&1 ; then
        yarn install
      else
        npm install
      fi
    )
  }

  _clone() {
    local git="$1"
    local dir="$2"

    if [ ! -d "${dir}" ]; then
      git clone ${git} "${dir}"
    fi

    _install "${dir}"
  }

  _clone https://github.com/SocketCluster/scc-state      scc-state
  _clone https://github.com/SocketCluster/scc-broker     scc-broker
  _clone https://github.com/rapidops/sc-redis-broker.git sc-redis-broker

  _install server
)
