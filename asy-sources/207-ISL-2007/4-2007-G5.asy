pair A = dir(210);
pair B = dir(-30);
pair C = dir(70);
circle u_c = circle(A, B, C);
pair A_1 = (B+C)/2;
pair B_1 = (A+C)/2;
pair C_1 = (A+B)/2;
pair P = dir(140);
pair A_p = intersectionpoints(u_c, line(P, A_1))[0];
pair B_p = intersectionpoints(u_c, line(P, B_1))[0];
pair C_p = intersectionpoints(u_c, line(P, C_1))[0];
pair A_0 = extension(B, B_p, C, C_p);
pair B_0 = extension(A, A_p, C, C_p);
pair C_0 = extension(A, A_p, B, B_p);

draw(u_c, blue);
draw(C--B_0--A);
draw(A--B--C--cycle);
draw(P--A_p, .8*red);
draw(P--B_p, .8*red);
draw(P--C_p, .8*red);
filldraw(triangle(A_0, B_0, C_0), opacity(0.2)+lightcyan, deepcyan);

dot("$A$", A, dir(210));
dot("$B$", B, dir(-30));
dot("$C$", C, dir(70));
dot("$A_1$", A_1, dir(30));
dot("$B_1$", B_1, dir(180));
dot("$C_1$", C_1, dir(-110));
dot("$P$", P, dir(140));
dot("$A'$", A_p, dir(-40));
dot("$B'$", B_p, dir(-30));
dot("$C'$", C_p, dir(-30));
dot("$A_0$", A_0, dir(-90));
dot("$B_0$", B_0, dir(140));
dot("$C_0$", C_0, dir(0));

/*
    Source: ISL 2007 G5
    Points: A B C P A_1 B_1 C_1 A_p B_p C_p A_0 B_0 C_0
    Item: A_1 B_1 C_0
    Item: B_1 C_1 A_0
    Item: C_1 A_1 B_0

    Text: $A_1$, $B_1$, $C_1$ are midpoints of the sides.
    Text: $P\in (ABC)$, $A'=PA_1\cap (ABC)$, etc.
    Text: $A_0=BB'\cap CC'$, $B_0=AA'\cap CC'$, $C_0=AA'\cap BB'$.
*/
