
system "l tick/log.q";
t_h:$[`tick in t:.Q.opt[.z.x]; hopen `$("::",t`tick);hopen `::5010];

load_trade:{[filename]
    data:("NSFJ";enlist ",") 0: filename;
    t_h(`.u.upd; `trade;data[cols data])
    };

load_quote:{[filename]
    .at.f: filename;
    data:("PSFFJJ";enlist ",") 0: filename;
    t_h(`.u.upd; `trade;data[cols data])
    };

mvFile:{[filename]
    
    nfn:string[.z.P],"_", fn:last "/" vs string filename;
    system"mv ","csv_drops/",fn," csv_drops/completed/",nfn;
    };

files_list:system "ls csv_drops";
qf:`$'":csv_drops/",/:(files_list where files_list like "*quote*");
tf:`$'":csv_drops/",/:(files_list where files_list like "*trade*");
if[count qf;
    .Q.fs[load_quote;] each qf;
    mvFile each qf
    ];
if[count tf;
    .Q.fs[load_trade;] each tf;
    mvFile each tf
    ];
.log.out["CSV load completed"]
/system"\\"
