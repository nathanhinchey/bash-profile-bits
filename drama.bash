#!/bin/bash

START_BG='printf \e[48;5;0m\e[K'
END_BG='printf \e[0m\e[K'

drama () {
	$START_BG
	echo
	echo "$1"
	echo
	$END_BG
}
