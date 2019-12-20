\d .feed
system "l tick/log.q";
t_h:$[`tick in t:.Q.opt[.z.x]; hopen `$("::",t`tick);hopen `::5010];
s:`x1`x2`x3;
pr:s!100 200 300;
/liquidity
coef: s! 100 100 100;
r:0.1;
genTrade:{[s;x] (.z.N;s;pr[s]+rand[-1 1]*rand 0.1;first 1?500)};
genQuote:{[s;x] (.z.N;s;pr[s]-1*rand 0.1; pr[s]+rand 0.1; rand 500; rand 500)};
genMsg:{
    prb:coef + s!count[s]?100;
    sym: first where prb= max prb;
    $[r< rand 1.0; 
        t_h(`.u.upd;`trade;flip genTrade[sym]\[1;genTrade[sym;1]]);
        t_h(`.u.upd;`quote;flip genQuote[sym]\[1;genQuote[sym;1]])
        ]}
.z.ts:{genMsg[]};
\t 10

