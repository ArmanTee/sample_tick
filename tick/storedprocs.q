// run below on server
// update stored procs into allowed
.z.po:{`allowed set kw!((count kw:key .z.W)#enlist string each storedProcs)};
// some testing functions/variables
fn1: {"Test"};
testvar:`test;
// stored proccedures, must be symbolised
`storedProcs set (`get;`set;`value;`fn1);
// port get will not allowed string entries 
.z.pg:{.at.x:x;
    $[10h = type x;
        $[((s in a) | (s:string (parse x) 0) in string value each a:allowed[.z.w]);
            value x;
            "Error: not a stored proc call"
            ];
        $[
        (not 10h = type x) & ((s in a) | (s:string[x 0]) in string value each a:allowed[.z.w]) ;
        value x;
        "Error: not a stored proc call"
        ]]
        };