pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
pair H = A+B+C;
pair D = foot(H, B, C);
pair E = foot(H, C, A);
pair F = foot(H, A, B);
pair P = foot(A, E, F);
pair Q = foot(H, E, F);
pair R_p = extension(P, D, H, Q);

draw(A--B--C--cycle);
draw(A--D);
draw(B--E);
draw(C--F);
draw(A--P, deepgreen);
draw(Q--R_p, deepgreen);
draw(D--E--F--cycle, lightblue);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$H$", H, dir(0));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(30));
dot("$F$", F, dir(180));
dot("$P$", P, dir(160));
dot("$Q$", Q, dir(110));
dot("$R'$", R_p, dir(-60));

/*
    Source: USA TST 2011/1 (4.45)
    Points: A B C D E F H P Q R_p
    Item: D P R_p
    Item: A E F H
    Item: B D F H
    Item: C D E H
    Item: B C E F
    Item: C A D F
    Item: A B D E

    Text: $H$ is the orthocenter.
    Text: $P$, $Q$ are feet of $A$, $H$ on $EF$ respectively.
    Text: $R'$ is the reflection of $Q$ over $H$.
*/
