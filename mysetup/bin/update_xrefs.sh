#! /usr/bin/env bash

if [ -z "$1" ]
then
    echo "Usage: `basename $0` <path> [<path> ...]"
    exit -1
fi

# ctags
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q "$@"

# cscope
rm -f ./cscope.*
touch cscope.files

for arg in "$@"
do
    find $arg -regex '.*\.\(h\|hpp\|hxx\|hh\|H\|c\|C\|cc\|CC\|cpp\|cxx\)' \
        -exec readlink -f '{}' \;  >> cscope.files
done
cscope -Rbkq

exit 0
