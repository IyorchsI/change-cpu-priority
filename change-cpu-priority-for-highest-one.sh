#!/bin/bash

game_exe="$1"

cpu_priority="$2"

wait_time="$3"

count=0

if [[ ${game_exe} = "" || ${cpu_priority} = "" || ${wait_time} = "" ]]; then
    echo "entrada vacía"
    sleep 1
    exit 1
fi

while ! pidof ${game_exe} >> /dev/null ;
do
sleep 1

count=$((count+1))

echo "tiempo: ${count}"

    if [[ ${count} -ge ${wait_time} ]]; then
        echo "sobrepasó el tiempo de espera:${count}"
        sleep 1
        exit 1
    fi
done

first_lettter=${game_exe:0:1}
last_word=${game_exe:1}
concat_value="[${first_lettter}]${last_word}"

echo "first_lettter:${first_lettter}"
echo "last_word:${last_word}"
echo "concat_value:${concat_value}"

pid_exe=$(ps aux | grep "${concat_value}" | sort -nrk 3 | head -1 | awk '{print $2}') # search for name a list of process by highest cpu (reverse order, correct numbers with the column 3), getting the first line and return the pid

if [[ ${pid_exe} = "" ]]; then
    echo "no se encontró el exe"
    sleep 1
    exit 1
fi

echo "pid_exe:${pid_exe}"

change_priority=$(renice ${cpu_priority} -p ${pid_exe}) # uses renice to change cpu priority between -20 to 19, the lesser value is the highest one

if [[ ${change_priority} = "" ]]; then
    echo "no se cambió la prioridad"
    sleep 1
    exit 1
fi

echo "prioridad cambiada: ${change_priority}"
sleep 1
exit 0
