# change-cpu-priority
There are 2 bash scripts **change-cpu-priority-for-highest-one.sh** and **steam-game-params.sh** <br/>

Make sure both bash files are in the same folder. <br/>

First of all you need open **steam-game-params.sh** with your favorite text editor, and change the params with your desired game. <br/>

Then execute **./steam-game-params.sh** in your terminal, it will ask you for your sudo password. <br/>

# steam-game-params.sh
This bash file contents inside multiple params of the process (exe), they'll be called in the secondary bash like args*. You need sudo for executing the secondary bash (nice and renice require it)
 # Params
-**basb_dir** Get the current location of the bash, used for calling the other one. <br/>
-**exe_name** Name of the exe file of your purchased game in steam (they're mostly dot exe). <br/>
-**priority_value** This is the value allowed for using nice and renice in the range betwen -20 and 19. The lesser value is the highest one. <br/>
-**wait_time** The time until the game is open. <br/>
-**steam_id** The id given by valve in their store. Example https://store.steampowered.com/app/1761390/Hatsune_Miku_Project_DIVA_Mega_Mix/ it's 1761390 <br/>
# hange-cpu-priority-for-highest-one.sh
This bash wait until the game is opend, if the time is exceded it will exit. When its found the bash will search the pid of the highest cpu usage, the reason why is the highest one because there are multiple instances of the same game and only one is using the cpu (most cases). And finally the bash calls for renice (you need sudo for this) and change the cpu priority, you can check that with htop (PRI and NI columns).
