#!/bin/bash
sudo chown -R $(whoami):$(whoami) {certs,redpanda-data,redpanda-config}
sudo rm -r redpanda-data/redpanda-0/* 2> /dev/null
sudo rm -r redpanda-data/redpanda-1/* 2> /dev/null
sudo rm -r redpanda-data/redpanda-2/* 2> /dev/null
sudo chown -R 101:101 {certs,redpanda-data,redpanda-config}

