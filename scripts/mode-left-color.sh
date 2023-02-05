#!/usr/bin/env bash
# setting the locale, some users have issues with different locales, this forces the correct one
export LC_ALL=en_US.UTF-8

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh

my_red='#ff5555'
my_green='#50fa7b'
my_dark_gray='#282a36'
my_gray='#44475a'

if [ "$1" = "after" ]; then
  after=true
else
  after=false
fi

primary_before_color="#[bg=${my_red},fg=${my_dark_gray}]"
primary_after_color="#[fg=${my_red},bg=${my_gray}]"

fallback_before_color="#[bg=${my_green},fg=${my_dark_gray}]"
fallback_after_color="#[fg=${my_green},bg=${my_gray}]"

main() {
  if [ -e /mode/PRIMARY ]; then
    if $after; then
      echo "${primary_after_color}"
    else
      echo "${primary_before_color}"
    fi
  else
    if $after; then
      echo "${fallback_after_color}"
    else
      echo "${fallback_before_color}"
    fi
  fi
  sleep $RATE
}

# run main driver
main