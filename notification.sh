#!/usr/bin/env bash

#-----------------------------------------------|
#	Author
#		Felipe Fernandes || Mewbi#5028
# 
#	Program
#		Notification Bot
#
#	Description
#		Simple notification bot to discord with webhook
#
#-----------------------------------------------|


#--------------------------------------[ Config ]
source config || { echo -e "Error importing config file"; exit; }
[[ -e cron ]] || { echo -e "Error importing cron file";}
#------------------------------------------------

#---------------------------------------[ Tests ]
# Check discord.sh in actual directory 
[[ $(grep '^discord.sh$' <<< $(ls)) ]] || { echo -e "Need 'discord.sh' in directory \nLink to download: https://github.com/ChaoticWeg/discord.sh"; exit; }

# Check empty vars
[[ -z $webhook ]] && { echo -e "Empty webhook link in config file"; exit;}
[[ -z $bot_name ]] && bot_name="Notification Bot"
[[ -z $bot_image ]] && bot_image="https://i.imgur.com/pr3LQqq.png"
#------------------------------------------------


#----------------------------------------[ Main ]
while :; do
    old_date="$(date +"%H:%M")"

    # Read cron
    while read -r task; do

        # Check task
        if [[ $(cut -d '|' -f 2 <<< $task) == $(date +"%H:%M") ]] && [[ $(grep $(date +"%a") <<< $(cut -d '|' -f 3 <<< $task)) ]]; then
       
        	bash discord.sh \
            	--webhook-url="$webhook" \
            	--username "$bot_name" \
            	--avatar "$bot_image" \
            	--title "$(cut -d '|' -f 1 <<< $task)" \
            	--text "Notification to: $(cut -d '|' -f 4 <<< $task)" \
            	--description "$(cut -d '|' -f 5 <<< $task)" \
            	--image "$(cut -d '|' -f 6  <<< $task)" &
        fi

    done <<< $(grep -v '^#\|^$' cron)

    # Hold check loop
    while [[ $old_date == $(date +"%H:%M") ]]; do
        sleep 30
    done
done
#------------------------------------------------