#!/usr/bin/env bash
scriptdir="$( dirname -- "$BASH_SOURCE"; )";

pushd "${scriptdir}"

rm -r "./node_modules" > /dev/null 2>&1
npm i > /dev/null 2>&1

npx tsx index.ts

popd