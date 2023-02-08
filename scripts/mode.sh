#!/usr/bin/env bash
# setting the locale, some users have issues with different locales, this forces the correct one
export LC_ALL=en_US.UTF-8

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh

check_mode() {
  if [ "$(hostname -s)" = "wmavm" ]; then
    echo ""
    return
  fi

  if [ -e /mode/PRIMARY ]; then
    echo "#[fg=red] Primary "
    return
  fi

  if [ -e /mode/SYNC_OFF ]; then
    echo " #[fg=red]"
  else
    echo " #[fg=green]"
  fi
}

main() {
  check_mode
  sleep $RATE
}

# run main driver
main
