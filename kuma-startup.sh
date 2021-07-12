#!/bin/bash

#download kuma binaries

function setup_kuma() {
	mkdir /tmp/kuma
	cd /tmp/kuma
	wget https://download.konghq.com/mesh-alpine/kuma-${kuma-version}-ubuntu-amd64.tar.gz
	tar -xzvf kuma-*.tar.gz
	cd kuma-${kuma-version}/bin
	ln -s ./kumactl /usr/bin/kumactl
}
function setup_server() {
	setup_kuma
	cd /tmp/kuma/kuma-${kuma-version}/bin
	./kuma-cp run &
}

function setup_client() {
	setup_kuma
}
case ${server} in

  *server*)
    setup_server
    ;;

   *client*)
    setup_client
    ;;
   *term-gw*)
    setup_terminating_gw
    ;;
    *)
    echo -n "unknown"
    ;;
esac
