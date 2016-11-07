#!/bin/bash

VERSION="1.0"

rm -rf docs

jazzy \
    --module-version $VERSION \
    --output docs/$VERSION \
    --clean \
    --theme apple \
    --module Taylor \
    --author Mirego  \
    --github_url https://github.com/mirego/taylor-ios

  