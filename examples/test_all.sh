#!/bin/sh


MAKEFILES=$(find */ -name Makefile)

for path in $MAKEFILES; do
  (
    dir=$(dirname $path)
    printf "%-40s" "$dir"
    cd $dir
    printf " running"
    fail_linecount=$(make 2>/dev/null | grep FAIL | wc -l)
    pass_linecount=$(make 2>/dev/null | grep PASS | wc -l)
    if [ "$fail_linecount" -gt "1" ]; then
      printf " - FAILED"
    elif [ "$pass_linecount" -gt "1" ]; then
      printf " - PASSED"
    else
      printf " - ERROR"
    fi
  )
  # Line jump
  printf "\n"
done

