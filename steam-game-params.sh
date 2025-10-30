#!/bin/bash

basb_dir="$(pwd)/"

exe_name="DivaMegaMix.exe"

priority_value=-20

wait_time=15

steam_id="1761390" #extracted from https://store.steampowered.com/app/1761390/Hatsune_Miku_Project_DIVA_Mega_Mix/

echo $basb_dir

steam "steam://rungameid/${steam_id}"

sudo "${basb_dir}change-cpu-priority-for-highest-one.sh" ${exe_name} ${priority_value} ${wait_time}

exit 0
