#!/bin/sh


MAKEFILES=$(find */ -name Makefile)

for path in $MAKEFILES; do
  (
    dir=$(dirname $path)
    printf "%-40s" "$dir"
    cd $dir
    if [ ! -f "$(ls e\~*.o 2> /dev/null)" ]; then
      printf " building"
      make analyse >/dev/null 2>&1 || (echo "$path analyse failed"; exit 1)
    else
      printf "         "
    fi
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

