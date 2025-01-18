pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair I = incenter(A, B, C);
pair M = dir(-90);
pair P = M+abs(M-I)*dir(85);

draw(u_c, blue);
draw(A--B--C--cycle);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$I$", I, dir(0));
dot("$P$", P, dir(0));

/*
    Source: ISL 2006 G1
    Points: A B C I P
    Item: B C I P
*/
