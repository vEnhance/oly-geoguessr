pair A = (-1, 0);
pair B = (-.5, 0);
pair C = (.3, 0);
pair D = (1, 0);
circle c_1 = circle(A, C);
circle c_2 = circle(B, D);
pair X = intersectionpoints(c_1, c_2)[1];
pair Y = intersectionpoints(c_1, c_2)[0];
pair Z = (X+Y)/2;
pair P = .7X+.3Y;
pair M = intersectionpoints(c_1, line(C, P))[1];
pair N = intersectionpoints(c_2, line(B, P))[1];
pair K = extension(A, M, X, Y);

filldraw(c_1, opacity(0.2)+mediumgrey, grey);
filldraw(c_2, opacity(0.2)+mediumgrey, grey);
draw(A--D, grey);
draw(C--M, grey);
draw(B--N, grey);
draw(K--Y, grey+dashed);
draw(A--K, grey+dashed);

dot("$A$", A, dir(180));
dot("$B$", B, dir(-130));
dot("$C$", C, dir(-40));
dot("$D$", D, dir(0));
dot("$K$", K, dir(90));
dot("$M$", M, dir(160));
dot("$N$", N, dir(40));
dot("$P$", P, dir(-5));
dot("$X$", X, dir(120)*1.4);
dot("$Y$", Y, dir(-100));
dot("$Z$", Z, dir(-45));

/*
    Source: IMO 1995/1 (2.31)
    Points: A B C D K M N P X Y Z
    Item: K M N P
    Item: B C M N
    Item: A D M N
    Item: A M P Z
    Item: D N P Z
    Item: D K N
    
    Text: $X$, $Y$ are the intersections of $(AC)$ and $(BD)$.
    Text: $Z=XY\cap BC$ and $P$ be arbitrary on $XY$.
    Text: $M=PC\cap (AC)$, $N=BP\cap (BD)$, $K=AM\cap XY$.
*/
