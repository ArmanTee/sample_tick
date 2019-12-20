/q tick/r.q [host]:port[:usr:pwd] [host]:port[:usr:pwd]
/2008.09.09 .k ->.q
.z.ws:{neg[.z.w].Q.s @[value;x;{`$ "'",x}]};
if[not "w"=first string .z.o;system "sleep 1"];

upd:insert;

/ get the ticker plant and history ports, defaults are 5010,5012
.u.x:.z.x,(count .z.x)_(":5010";":5012");

/ end of day: save, clear, hdb reload
.u.end:{t:tables`.;t@:where `g=attr each t@\:`sym;.Q.hdpf[`$":",.u.x 1;`:.;x;`sym];@[;`sym;`g#] each t;};

/ init schema and sync up from log file;cd to hdb(so client save can run)
.u.rep:{.at.x:x;.at.y:y;(.[;();:;].)each x;if[null first y;:()];-11!y;system "cd ",1_-10_string first reverse y};
/ HARDCODE \cd if other than logdir/db
system "l tick/log.q";
/ connect to ticker plant for (schema;(logcount;log))
// subscribe to trade and to quote
.u.rep (hopen `$":",.u.x 0)"(.u.sub[`trade;`];`.u `i`L)";
.u.rep (hopen `$":",.u.x 0)"(.u.sub[`quote;`];`.u `i`L)";
