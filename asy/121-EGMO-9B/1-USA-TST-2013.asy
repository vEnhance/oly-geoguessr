pair A = dir(210);
pair B = dir(-30);
pair C = dir(110);
pair H = A+B+C;
pair D = foot(C, A, B);
pair E = foot(B, A, C);
pair F = foot(A, B, C);
circle c_1 = circle(A, C, D);
circle c_2 = circle(B, C, D);
pair K = intersectionpoints(c_2, line(A, F))[0];
pair M = intersectionpoints(c_2, line(A, F))[1];
pair L = intersectionpoints(c_1, line(B, E))[0];
pair N = intersectionpoints(c_1, line(B, E))[1];
pair J = extension(N, K, M, L);

draw(A--B--C--cycle);
draw(c_1, lightblue);
draw(c_2, lightblue);
draw(A--M, deepcyan);
draw(B--N, deepcyan);
draw(M--J, .8*red);

dot("$A$", A, dir(210));
dot("$B$", B, dir(-30));
dot("$C$", C, dir(100));
dot("$H$", H, dir(-90));
dot("$D$", D, dir(-100));
dot("$E$", E, dir(210));
dot("$F$", F, dir(0));
dot("$K$", K, dir(160));
dot("$M$", M, dir(30));
dot("$L$", L, dir(-80));
dot("$N$", N, dir(180));
dot("$J$", J, dir(-90));

/*
    Source: USA TST 2013 (9.51)
    Points: A B C H D E F K M L N J
    Item: C H D
    Item: K L M N
    Item: C E F H
    Item: A D E H
    Item: B D F H
    Item: A B E F
    Item: J K N

    Text: $AH$ intersects $(BC)$ at $K$, $M$. Similarly $BH$ intersects $(AC)$ at $L$, $N$.
    Text: $D=(AC)\cap (BC)$, $J=AB\cap ML$.
*/
