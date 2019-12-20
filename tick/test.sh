#!/bin/bash
test(){
    ps -ef | grep $1 | grep -v grep| grep -v test | wc -l
};


#!/bin/bash
run_script(){
    if [ $1 == 1 ];
    then
        t=$(test tick.q)
        if [ $t == 1 ];
        then
            echo "ticker plant currently running"
        else
            echo "tickerplant not up"
        fi
    elif [ $1  == 2 ];
    then
        t=$(test feed.q)
        if [ $t == 1 ];
        then
            echo "feedhandler currently running"
        else
            echo "feedhandler not up"
        fi
    elif [ $1 == 3 ];
    then
        t=$(test r1.q)
        if [ $t == 1 ];
        then
            echo "both RDBs are running"
        else
            echo "one or both RDBs not up"
        fi
    elif [ $1 == 4 ];
    then
        t=$(test tick.q)
        if [ $t == 1 ];
        then
            echo "RTE  currently running"
        else
            echo "RTE not up"
        fi
    else
        echo enter 1 2 3 4
    fi
}

for arg in $@
do 
    run_script $arg
done

echo script finished

