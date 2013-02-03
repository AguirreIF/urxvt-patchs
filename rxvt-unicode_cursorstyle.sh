#! /bin/bash

echo -ne "\033]12;yellow\007"
echo -ne "\033[0 q"; echo -n "Yellow Blinking block cursor : " ; read foo
echo -ne "\033[2 q"; echo -n "Yellow Steady block cursor : " ; read foo

echo -ne "\033]12;blue\007"
echo -ne "\033[3 q"; echo -n "Blue Blinking underline cursor : " ; read foo
echo -ne "\033[4 q"; echo -n "Blue Steady underline cursor : " ; read foo

echo -ne "\033]12;white\007"
echo -ne "\033[5 q"; echo -n "White Blinking bar cursor : " ; read foo
echo -ne "\033[6 q"; echo -n "White Steady bar cursor : " ; read foo
