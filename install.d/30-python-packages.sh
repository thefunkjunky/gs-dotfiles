#!/usr/bin/env bash

## Python / Python3 setup

## Ignore if we're not on Debian/Ubuntu
[[ -f /etc/debian_version ]]|| exit 0


pip3 install -U pip
pip3 install -U setuptools \
                virtualenv \
                xonsh \
                jupyter \
                ansible \
                pyinstaller \
                pytest \
                mypy \
                requests \
                scrapy

pip install -U pip


