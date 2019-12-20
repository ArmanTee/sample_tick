#!/bin/bash
run_script(){
    if [ $1 == 1 ];
    then
        ps -ef|grep tick.q| grep -v grep | awk '{print $2}'| xargs kill 
        echo "stopped tickerplant"
        sleep "1"
    elif [ $1  == 2 ];
    then
        ps -ef|grep feed.q| grep -v grep | awk '{print $2}'| xargs kill 
        echo "stopped feedhandler"
        sleep "1"
    elif [ $1 == 3 ];
    then
        ps -ef|grep tick/r1.q| grep -v grep | awk '{print $2}'| xargs kill 
        echo "stopped trade/quote rdb"
        sleep "1"
        echo "stopped tradeStats rdb "
        ps -ef|grep tick/r2.q| grep -v grep | awk '{print $2}'| xargs kill 
        sleep "1"
    elif [ $1 == 4 ];
    then 
        echo "starting RTE"
        ps -ef|grep tick/rte.q| grep -v grep | awk '{print $2}'| xargs kill 
    else
        echo enter 1 2 3 4
    fi
}

for arg in $@
do 
    run_script $arg
done

echo script finished

