/q tick/r.q [host]:port[:usr:pwd] [host]:port[:usr:pwd]
/2008.09.09 .k ->.q
if[not "kdb_tick" ~ last "/" vs first system"pwd"; 
    .log.out["please run this script from the kdb_tick directory only"]; 
    system"\\"];

if[not "w"=first string .z.o;system "sleep 1"];

upd:insert;
    
/ get the ticker plant and history ports, defaults are 5010,5012
.u.x:.z.x,(count .z.x)_(":5010";":5012");

/ end of day: save, clear, hdb reload
.u.end:{t:tables`.;t@:where `g=attr each t@\:`sym;.Q.hdpf[`$":",.u.x 1;`:.;x;`sym];@[;`sym;`g#] each t;};

/ init schema and sync up from log file;cd to hdb(so client save can run)
.u.rep:{.at.x:x;.at.y:y;(.[;();:;].)each x;if[null first y;:()];-11!y;};
/ HARDCODE \cd if other than logdir/db
system "l tick/log.q";
/ connect to ticker plant for (schema;(logcount;log))
// subscribe to trade and to quote

$[not first count each  .Q.opt[.z.x]`logFile;
    .u.rep . dt:(hopen `$":",.u.x 0)"(.u.sub[`;`];`.u `i`L)";
    -11! hsym `$first .Q.opt[.z.x]`logFile];


.eod.dbdir: `:data/marketData;
.eod.end:{[tab;p]
            .at.d:(tab;p);
            (`$string[.eod.dbdir],"/",string[p],"/",string[tab];``sym`time!((17;2;6);(0;0;0);(0;0;0)))  set update sym:`p#sym from  `sym`time xasc .Q.en[.eod.dbdir;get tab]
            }[;"D"$-10#string dt [1;1]]; 
.eod.end each tables`.

            