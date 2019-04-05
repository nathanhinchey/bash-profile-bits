copy_and_print(){
  echo "$1" | pbcopy
  green_on_black='\033[1;40;92m'
  default='\033[0;39m'
  echo "echo -e \"copied ${green_on_black}$1${default}\" to clipboard"
}

# generates a unique-ish string seeded on current seconds
rand_str(){
  echo $(date +%s | sha256sum | base64 | head -c 32)
}

sdiff(){
  prefix="temp_for_diff_"$(rand_str)
  file_name_1="$prefix""-1.txt"
  file_name_2="$prefix""-2.txt"
  echo $1 > $file_name_1
  echo $2 > $file_name_2
  vim -d $file_name_1 $file_name_2
  rm $file_name_1 $file_name_2
}

alias 80='echo "---------1---------2---------3---------4---------5---------6---------7---------8"'
alias shrug=$(copy_and_print "¯\\_(ツ)_/¯")
