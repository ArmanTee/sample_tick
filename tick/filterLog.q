
/// usage example
// q tick/filterLog.q -logFile sym2019.10.02 -syms x1 x2
// new filtered sym logfile will appear inside tick_log/filteredTicks


system "l tick/log.q";
if[not count .Q.opt[.z.x];
    .log.out["no command line params entered,  exiting "]
    system "\\"];
if[not first count each  .Q.opt[.z.x]`logFile;
    .log.out["missing logFile command line param, please use -logFile x"]
    system "\\"];
if[not first count each  .Q.opt[.z.x]`syms;
    .log.out["missing logFile command line param, please use -syms x"]
    system "\\"];

if[not "kdb_tick" ~ last "/" vs first system"pwd"; 
    .log.out["please run this script from the kdb_tick directory only"]; 
    system"\\"];

filter:{[filename;syms]
    dir:hsym `$"tick_log/",filename;
    newDir: hsym `$"tick_log/filteredTicks/filtered_",filename;
    .[newDir;();:;()];
    l: hopen newDir;
    a:get dir;
    a:a where any each (a[;2][;1] in syms);
    l a
    hclose l
    };

filter[first .Q.opt[.z.x]`logFile; `$' .Q.opt[.z.x]];
.log.out["new logfile created"];
system"\\"


