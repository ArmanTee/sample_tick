/q tick/rte.q [host]:port[:usr:pwd] [host]:port[:usr:pwd]

if[not "w"=first string .z.o;system "sleep 1"];



/ get the ticker plant and history ports, defaults are 5010,5012
.u.x:.z.x,(count .z.x)_(":5010";":5012");

/ end of day: save, clear, hdb reload
.u.end:{t:tables`.;t@:where `g=attr each t@\:`sym;.Q.hdpf[`$":",.u.x 1;`:.;x;`sym];@[;`sym;`g#] each t;};

/ init schema and sync up from log file;cd to hdb(so client save can run)
.u.rep:{.at.x:x;.at.y:y;(.[;();:;].)each x;if[null first y;:()];-11!y;system "cd ",1_-10_string first reverse y};
/ HARDCODE \cd if other than logdir/db
system "l tick/log.q";
/trade:([] time:`timespan$(); sym:`$(); price:`float$(); qty:`float$());
quote:([sym:`$()] time:`timespan$(); bid:`float$(); ask:`float$(); bidSize:`long$(); askSize:`long$());
tradeStats:([] time:`timespan$();sym:`$(); minTradePrice:`float$(); maxTradePrice:`float$();tradeVol:`long$();bid:`float$();ask:`float$();askSize:`long$();bidSize:`long$());

/ connect to ticker plant for (schema;(logcount;log))
.u.rep (hopen `$":",.u.x 0)"(.u.sub[`trade;`];`.u `i`L)";
(hopen `$":",.u.x 0)"(.u.sub[`quote;`];`.u `i`L)";


upd:{$[`trade=x;x upsert  y; x upsert `sym xkey y];
    `tradeStats_i upsert update tradeVolNew:bidSize+askSize from   (select last time,m1:min price, m2: max price by sym from trade) lj quote;
    `tradeStats upsert 0!(select time,sym,minTradePrice:m1, maxTradePrice:m2, bid, ask, askSize, bidSize from tradeStats_i where not sym in tradeStats`sym);
    `tradeStats set select time, sym, minTradePrice: min (minTradePrice, m1), maxTradePrice: max (maxTradePrice, m2), tradeVol: (bidSize+askSize)^tradeVol+bidSize+askSize, bid,ask,askSize,bidSize from tradeStats lj tradeStats_i  ;
    .z.w(`.u.upd;`tradeStats; flip value each tradeStats)
    }

