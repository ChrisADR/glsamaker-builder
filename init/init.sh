#!/bin/bash

mysqld_safe&
cd /glsamaker
./bin/setup
./bin/rails server -b 0.0.0.0
