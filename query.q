{[x]
    {
        $[10h~abs type x;
            x:"D"$x;
            -14h~ type x;
            x:x;
            `date$x
            ]
    }'[x]
    
    } 

updatedQ:{?[10h~abs type x;"d"$x;-14h~ type x;x:`date$x]}

StringtoDate2:{@[x;where 10h= abs type each x;"D"$]}



(enlist `ric)!enlist ($;`;((';,);($:;`sym);((';,);".";($:;`exch))))



?[`trade_usq;
    enlist (any;(not;(null;(enlist;`size;`price))));
    enlist(`ticker)!enlist( (';,);((,;\:); (string;`id); ".");(string;`ex));
    enlist(size)!enlist(sum;`size)]



    f1:{x+y+z},f2:{x+y-z},f3:{x-y+z}  a:1 2 3.


    randNorm:{[x;y] x+y*sqrt[-2*log[rand[1.0]]]*cos[2*3.1415*rand[1.0]]}

"Name", "Team", "Position", "Height(inches)", "Weight(lbs)", "Age"
"Adam Donachie", "BAL", "Catcher", 74, 180, 22.99
"Paul Bako", "BAL", "Catcher", 74, 215, 34.69
"Ramon Hernandez", "BAL", "Catcher", 72, 210, 30.78
"Kevin Millar", "BAL", "First Baseman", 72, 210, 35.43
"Chris Gomez", "BAL", "First Baseman", 73, 188, 35.71
"Brian Roberts", "BAL", "Second Baseman", 69, 176, 29.39
"Miguel Tejada", "BAL", "Shortstop", 69, 209, 30.77
"Melvin Mora", "BAL", "Third Baseman", 71, 200, 35.07
"Aubrey Huff", "BAL", "Third Baseman", 76, 231, 30.19
"Adam Stern", "BAL", "Outfielder", 71, 180, 27.05
"Jeff Fiorentino", "BAL", "Outfielder", 73, 188, 23.88
"Freddie Bynum", "BAL", "Outfielder", 73, 180, 26.96
"Nick Markakis", "BAL", "Outfielder", 74, 185, 23.29
"Brandon Fahey", "BAL", "Outfielder", 74, 160, 26.11
