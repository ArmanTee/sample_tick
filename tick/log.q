
logFileName:`$"processLogs/",ssr[ssr[string[.z.P];":";""];".";""],"_ProcessLog";
hsym[logFileName] set "";
.log.fh: hopen hsym[logFileName];
.log.msg: {[msg;h;usr;t] t:((`e`w`o)!("ERROR";"WARN";"OUT"))[t]; neg[1] msg:(t," -- @", string[.z.P]," -  From ",string[.z.u],":",msg," --  via handle: ",string[h]," -- ", -3!.Q.w[] );.log.fh msg}
.log.out: .log.msg[;0;.z.u;`o];
.log.err: .log.msg[;0;.z.u;`e];
.log.warn: .log.msg[;0;.z.u;`w];
.z.po_log: .log.msg["Port open to this process";;;`o];
.z.pc_log: .log.msg["Port close to this process";;;`o];

// check if .z.po/ pc exists, if they don't, simply replace with 1b. 
@[value;`.z.po;.z.po:{1b}];
@[value;`.z.pc;.z.pc:{1b}];
.z.po_old: .z.po;
.z.po:{.at.x: x;b: .z.po_old[x]; if[b; .z.po_log[x;x".z.u"]];b}
.z.pc_old: .z.pc;
.z.pc:{.at.x: x; b: .z.pc_old[x]; if[b; .z.pc_log[x;`unknown]];b}


