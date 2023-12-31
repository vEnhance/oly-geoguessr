pair A = dir(110);
pair B = dir(210);
pair C = dir(340);
pair D = dir(30);
pair P = extension(B, A, C, D);
pair Q = extension(A, D, B, C);
pair K = midpoint(A--C);
pair L = midpoint(B--D);
pair M = midpoint(P--Q);

draw(B--P--C);
draw(A--Q--B);
draw(A--C, dashed);
draw(B--D, dashed);
draw(P--Q, dashed);

dot("$A$", A, dir(A));
dot("$B$", B, dir(B));
dot("$C$", C, dir(C));
dot("$D$", D, dir(D));
dot("$P$", P, dir(P));
dot("$Q$", Q, dir(Q));
dot("$K$", K, dir(K));
dot("$L$", L, dir(L));
dot("$M$", M, dir(M));

/*
    Source: ISL 2009 G4
    Points: A B C D P Q K L M
    Item: K L M
    Text: $K$, $L$, and $M$ are midpoints.
*/
