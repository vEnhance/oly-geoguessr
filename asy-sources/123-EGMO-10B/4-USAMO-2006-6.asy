pair A = .8*dir(140);
pair B = dir(210);
pair C = dir(-30);
pair D = dir(75);
pair P = extension(A, B, C, D);
pair Q = extension(A, D, B, C);
pair M = intersectionpoints(circle(A, B, Q), circle(A, D, P))[1];
pair E = .7A+.3D;
pair S = intersectionpoints(circle(A, E, M), line(A, B))[1];
pair F = extension(B, C, E, S);
pair T = extension(C, D, E, F);

filldraw(A--B--C--D--cycle, opacity(0.1)+lightgreen, deepgreen);
draw(A--Q--B, deepgreen);
draw(A--P--D, deepgreen);
draw(T--F, lightblue);
draw(T--P);

dot("$A$", A, dir(130)*1.2);
dot("$B$", B, dir(230));
dot("$C$", C, dir(-50));
dot("$D$", D, dir(0));
dot("$E$", E, dir(-30));
dot("$F$", F, dir(-90));
dot("$M$", M, dir(180));
dot("$P$", P, dir(0));
dot("$Q$", Q, dir(180));
dot("$S$", S, dir(0));
dot("$T$", T, dir(90));

/*
    Source: USAMO 2006 P6 (10.24)
    Points: A B C D E F M P Q S T
    Item: A B Q M
    Item: C D Q M
    Item: A D P M
    Item: B C P M
    Item: E F Q M
    Item: A E S M
    Item: B F S M
    Item: T P S M
    Item: T D E M

    Text: $\frac{AE}{ED}=\frac{BF}{FC}$, $S=EF\cap AB$, $T=EF\cap CD$.
    Text: $M$ is the miquel point of quadrilateral $ABCD$.
*/
