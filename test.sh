#!/bin/bash
cp -r ./a/f ./b > /dev/null 2>&1 || { echo >&2 "no no no..."; exit 1; }
