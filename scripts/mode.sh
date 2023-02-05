#!/usr/bin/env bash
# setting the locale, some users have issues with different locales, this forces the correct one
export LC_ALL=en_US.UTF-8

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh

main() {
  if [ -e /mode/PRIMARY ]; then
    echo "#[fg=red] Primary "
  else
    echo ""
  fi
  sleep $RATE
}

# run main driver
main