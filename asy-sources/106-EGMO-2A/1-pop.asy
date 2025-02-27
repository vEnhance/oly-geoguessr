pair A = dir(150);
pair B = dir(70);
pair X = dir(-30);
pair Y = dir(200);
pair P = extension(A, B, X, Y);

filldraw(A--B--X--Y--cycle, opacity(0.2)+mediumgrey, grey);
draw(A--P--Y, dotted);        

dot("$A$", A, dir(110));
dot("$B$", B, dir(30));
dot("$X$", X, dir(0));
dot("$Y$", Y, dir(-110));
dot("$P$", P, dir(180));

/*
    Source: Converse of the Power of a Point (2.4)
    Points: A B P X Y
    Item: A B X Y
    
    Text: $PA\cdot PB=PX\cdot PY$.
*/
