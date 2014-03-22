#!/bin/bash

# usage:
# ./report_for_each_sha.sh 'ruby ../dumb_metric.rb fibonacci.rb'

set -e

test_command=$1

main() {
    revs=`git log --format=oneline | cut -d ' ' -f 1`
    for rev in $revs; do
        echo $rev
        git checkout --quiet $rev
        score=$(eval "$test_command")
        echo "$rev, $score" >> output.csv
    done
    git checkout master
}

# main() {
#     revs=`git log --format=oneline | cut -d ' ' -f 1`

#     for rev in $revs; do
#         echo $rev
#         git checkout --quiet $rev
#         eval "$test_command"
#         git reset --hard
#     end
# }

main
