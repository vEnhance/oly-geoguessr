pair A = (-1, 0);
pair B = (1, 0);
pair M = .6A+.4B;
pair C = rotate(60, A)*M;
pair D = rotate(-60, B)*M;
pair N = extension(A, D, B, C);
pair E = rotate(60, B)*A;

filldraw(triangle(A, C, M), opacity(0.2)+mediumgrey, grey);
filldraw(triangle(B, D, M), opacity(0.2)+mediumgrey, grey);
filldraw(triangle(A, B, E), opacity(0.2)+lightgrey, dotted);
draw(circle(A, C, M), grey);
draw(circle(B, D, M), grey);

dot("$A$", A, dir(180));
dot("$B$", B, dir(0));
dot("$C$", C, dir(90));
dot("$D$", D, dir(90));
dot("$E$", E, dir(-90));
dot("$M$", M, dir(-95));
dot("$N$", N, dir(15));

/*
    Source: BAMO 2012/4 (2.27)
    Points: A B C D E M N
    Item: A D N
    Item: B C N
    Item: E M N

    Text: $\triangle ACM$, $\triangle BDM$ and $\triangle ABE$ are equilateral.
    Text: $N=(ACM)\cap (BDM)$.
*/
