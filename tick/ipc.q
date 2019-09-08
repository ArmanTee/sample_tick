`messageLog set flip (`handle`ip`user`type`runTime`msg)!();
`userLog set ()!();
.z.pw:{[x;y].at.x:x;.at.y:y; `userLog upsert (enlist .z.w)!x;1b};
.z.ps:{
    /if self, only value
    if[0 =.z.w;:value x];
    t1:.z.P;
    val: value x;
    t2:.z.P;
    ip:.z.w".z.a";
    `messageLog upsert (`handle`ip`user`type`runTime`msg)!(.z.w;ip; userLog[.z.w]; `async;t2-t1;raze string x);
    val
};
.z.pg:{
    /if self, only value
    if[0 =.z.w;:value x];
    t1:.z.P;
    val: value x;
    t2:.z.P;
    ip:.z.w".z.a";
    `messageLog upsert (`handle`ip`user`type`runTime`msg)!(.z.w;ip; userLog[.z.w]; `sync;t2-t1;raze string x);
    val
};