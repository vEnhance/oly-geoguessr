pair A = .75*dir(140);
pair B = dir(80);
pair C = dir(-30);
pair D = dir(210);
pair P = extension(A, D, B, C);
pair Q = extension(A, B, C, D);
pair K = (P+Q)/2;
pair L = (A+C)/2;
pair M = (B+D)/2;
pair H_1 = orthocenter(B, C, Q);
pair H_2 = orthocenter(A, D, Q);
pair H_3 = orthocenter(A, B, P);
pair H_4 = orthocenter(C, D, P);

filldraw(A--B--C--D--cycle, opacity(0.1)+lightgreen, deepgreen);
draw(P--Q, dotted);
draw(A--C, dotted);
draw(B--D, dotted);
draw(A--P--B);
draw(A--Q--D);

dot("$A$", A, dir(130));
dot("$B$", B, dir(30));
dot("$C$", C, dir(-60));
dot("$D$", D, dir(240));
dot("$K$", K, dir(130));
dot("$L$", L, dir(50));
dot("$M$", M, dir(160));
dot("$P$", P, dir(90));
dot("$Q$", Q, dir(180));
dot("$H_1$", H_1, dir(0));
dot("$H_2$", H_2, dir(0));
dot("$H_3$", H_3, dir(0));
dot("$H_4$", H_4, dir(0));

/*
    Source: Gauss-Bodenmiller Theorem (10.5)
    Points: A B C D K L M P Q H_1 H_2 H_3 H_4
    Item: K L M
    Item: H_1 H_2 H_3 H_4

    Text: $H_1$, $H_2$, $H_3$, $H_4$ are the orthocenters of $\triangle BCQ$, $\triangle ADQ$, $\triangle ABP$, $\triangle CDP$ respectively.
    Text: $K$, $L$, $M$ are the midpoints of $PQ$, $AC$, $BD$.
*/
