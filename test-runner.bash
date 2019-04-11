#1 = bold; 35 = magenta; 95=light magenta
fancy() { echo -e "\033[1;35m"; }
default() { echo -e "\033[0m"; }
underline="\033[4m"

suite() {
  printf "\n\n\n\n"
  fancy
  echo -e   "${underline}===================================="
  echo -e   " 🔍 🔎 🔍 🔎 🔍 🔎 🔍 🔎 🔍 🔎 🔍 🔎"
  echo -e   "        🏃  RUNNING TESTS  🏃"
  echo
  echo -e   "selected tests:"
  for test in $@
  do
    echo -e "  • $test"
  done
  for test in $@
  do
    fancy
    echo "------------------------------------"
    echo ""
    echo -e "running $test"
    default
    rake test TEST=$test
  done
  fancy
  echo -e   "     🏃  DONE RUNNING TESTS!  🏃"
  echo ""
  echo -e   " 🔍 🔎 🔍 🔎 🔍 🔎 🔍 🔎 🔍 🔎 🔍 🔎 "
  echo -e   "${underline}===================================="
  printf "\n\n\n\n"
  default
}
