pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
pair P = .4*dir(180);
pair D = extension(A, P, B, C);
pair E = extension(B, P, C, A);
pair F = extension(C, P, A, B);
pair X = extension(E, F, B, C);

draw(A--B--C--cycle);
draw(A--D, lightblue);
draw(B--E, lightblue);
draw(C--F, lightblue);
draw(X--B, dashed);

dot("$A$", A, dir(110));
dot("$B$", B, dir(230));
dot("$C$", C, dir(-50));
dot("$P$", P, dir(-10));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(30));
dot("$F$", F, dir(180));
dot("$X$", X, dir(180));

/*
    Source: Cevians Induces Harmonic Bundles (9.11)
    Points: A B C D E F P X
    Item: E F X

    Text: $(XD;BC)$ is harmonic
*/
