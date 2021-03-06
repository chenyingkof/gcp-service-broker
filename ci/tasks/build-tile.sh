#!/usr/bin/env bash

set -e

export service_broker_dir=src/gcp-service-broker
export current_version="$(cat version/version)"

pushd "$service_broker_dir"
    zip /tmp/gcp-service-broker.zip -r . -x *.git* product/\* release/\* examples/\*

    tile build "$current_version"
popd

mv "$service_broker_dir/product/"*.pivotal candidate/