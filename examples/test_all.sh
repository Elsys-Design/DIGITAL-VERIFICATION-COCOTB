#!/bin/sh


MAKEFILES=$(find */ -name Makefile)

for path in $MAKEFILES; do
  (
    dir=$(dirname $path)
    printf "%-40s" "$dir"
    cd $dir
    if [ ! -d sim_build ]; then
      printf " building"
      make analyse >/dev/null 2>&1 || (echo "$path analyse failed"; exit 1)
    else
      printf "        "
    fi
    printf " running"
    fail_linecount=$(make 2>/dev/null | grep FAIL | wc -l)
    if [ "$fail_linecount" -gt "1" ]; then
      printf " - FAILED"
    else
      printf " - PASSED"
    fi
  )
  # Line jump
  printf "\n"
done

