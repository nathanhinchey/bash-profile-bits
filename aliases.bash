copy_and_print(){
  printf "$1" | pbcopy
  green_on_black='\033[1;40;92m'
  default='\033[0;39m'
  echo -e "copied \"${green_on_black}$1${default}\" to clipboard"
}

# generates a unique-ish string seeded on current seconds
rand_str(){
  date +%s | sha256sum | base64 | head -c 32
}

# sdiff <text> <text>
#  creates temporary files to do a vim diff on the two argumentts.
#  Useful for comparing text quickly using the clipboard.
sdiff(){
  prefix="temp_for_diff_$rand_str"
  file_name_1="$prefix""-1.txt"
  file_name_2="$prefix""-2.txt"
  echo $1 > $file_name_1
  echo $2 > $file_name_2
  vim -d $file_name_1 $file_name_2
  rm $file_name_1 $file_name_2
}

# drama <text>
#   displays the text with a black backround and a line of padding
#   above and below.
drama () {
  printf "\e[48;5;0m\e[K"
  printf "\n\e[K"
	printf "$1\n\e[K"
  printf "\n\e[K"
  printf "\e[0m\e[K"
}

alias 80='echo "---------1---------2---------3---------4---------5---------6---------7---------8"'
alias shrug="copy_and_print \"¯\\_(ツ)_/¯\""
