pair A = (0, 0);
pair B = (1, 0);
pair C = (.85, .5);
pair D = C+.5*dir(B--A);
pair S = extension(A, D, B, C);
pair K = .6A+.4B;
pair L = extension(K, S, C, D);
pair P = .255K+.745L;
circle c_1 = circle(B, C, P);
pair Q = intersectionpoints(c_1, line(K, S))[0];
pair E = extension(A, P, D, Q);
pair F = extension(B, P, C, Q);

draw(D--C);
draw(D--Q--C);
draw(A--P--B);
draw(A--S--B--cycle);

dot("$A$", A, dir(180));
dot("$B$", B, dir(0));
dot("$C$", C, dir(0));
dot("$D$", D, dir(180));
dot("$S$", S, dir(80));
dot("$K$", K, dir(-90));
dot("$L$", L, dir(80));
dot("$P$", P, dir(70));
dot("$Q$", Q, dir(-100));
dot("$E$", E, dir(160));
dot("$F$", F, dir(0));

/*
    Source: ISL 2006 G2
    Points: A B C D S K L P Q E F
    Item: K L P Q S
    Item: B C B Q
    Item: EFPQ

    Text: $S=AD\cap BC$
    Text: $E=AP\cap DQ$, $F=BP\cap CQ$
*/
