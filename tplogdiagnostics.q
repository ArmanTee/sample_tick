upd:insert;
/ the following syntax of -11! will return 
a: get `:tplog;

tpraze:{[t;w]     t[w]: raze t[w ,(w+1), (w+2)];    (t _ w+2) _ w+1    };
a:tpraze/[raze (enlist a;  (b + (til count (b:where a~\: enlist `upd))*-2))];
updtypes:{x:$["c" ~ first first meta x;update sym:`$'sym from x; x]; $["f" ~ first last meta x;update size:`long$size from x; x]}
 a[;2]:updtypes each a[;2];
 `:tplog set a;


