#!/bin/bash
./build.sh
bundle install --without development:test
rspec --format progress --format RspecJunitFormatter --out rspec.xml
