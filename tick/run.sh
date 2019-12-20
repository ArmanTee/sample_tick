#!/bin/bash
run_script(){
    if [ $1 == 1 ];
    then
        nohup q tick.q  sym tick_log -p 5010 </dev/null >> tickperplant.log 2>&1 &
        echo "starting tickerplant"
        sleep "1"
    elif [ $1  == 2 ];
    then
        nohup q feed.q -p 5011 </dev/null >> feedhandler.log 2>&1 &
        echo "starting feedhandler"
        sleep "1"
    elif [ $1 == 3 ];
    then
        nohup q tick/r1.q -p 5012 </dev/null >> rdb1.log 2>&1 &
        echo "starting trade/quote rdb"
        sleep "1"
        echo "starting tradeStats rdb "
        nohup q tick/r2.q -p 5013 </dev/null >> rdb2.log 2>&1 &
        sleep "1"
    elif [ $1 == 4 ];
    then 
        echo "starting RTE"
        nohup q tick/rte.q -p 5014 </dev/null >> rte.log 2>&1 &
    else
        echo enter 1 2 3 4
    fi
}

for arg in $@
do 
    run_script $arg
done

echo script finished

