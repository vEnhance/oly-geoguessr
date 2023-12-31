pair A = dir(110);
pair B = dir(220);
pair C = dir(340);
pair D = dir(40);
pair E = extension(A, C, B, D);
pair F = extension(A, D, B, C);
pair G = midpoint(A--B);
pair H = midpoint(C--D);
pair M = midpoint(E--F);
pair X = 2*G - E;
pair Y = 2*H - E;

draw(circumcircle(A, B, C));
draw(A--B--C--D--cycle);
draw(A--C--F--D--B);
draw(E--F, dashed);

dot("$A$", A, dir(A));
dot("$B$", B, dir(B));
dot("$C$", C, dir(C));
dot("$D$", D, dir(D));
dot("$E$", E, 2*plain.W);
dot("$F$", F, dir(F));
dot("$G$", G, dir(G));
dot("$H$", H, plain.SW);
dot("$M$", M, plain.S);
dot("$X$", X, dir(X));
dot("$Y$", Y, plain.W);

/*
    Source: ISL 2009 G4
    Points: A B C D E F G H M X Y
    Item: E G X
    Item: E H Y
    Item: G H M
    Item: F X Y
    Text: $G$, $H$, and $M$ are midpoints
    Text: $BEAX$ and $CEDY$ are parallelograms
*/
