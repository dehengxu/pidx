#!/bin/bash
rake build
sudo rvm all do gem install --local pkg/pidx-0.0.1.gem