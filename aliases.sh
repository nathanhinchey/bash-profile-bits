copy_and_print(){
  echo "$1" | pbcopy
  green_on_black='\033[1;40;92m'
  default='\033[0;39m'
  echo "echo -e \"${green_on_black}$1${default}\""
}

alias 80='echo "---------1---------2---------3---------4---------5---------6---------7---------8"'
alias shrug=$(copy_and_print "¯\\_(ツ)_/¯")
# alias sdiff=${string_diff}
# alias rs=
alias test='echo -e "\e[107m\e[30mASDF"'
