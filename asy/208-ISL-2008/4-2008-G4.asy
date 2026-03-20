pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair H = A+B+C;
pair D = foot(A, B, C);
pair E = foot(B, C, A);
pair F = foot(C, A, B);
pair P = B+sqrt(abs(B-F)*abs(B-A))*dir(B--D);
pair Q = 2*B-P;
pair O_2 = circumcenter(A, F, Q);
pair X = extension(Q, F, P, E);
circle c_1 = circle(A, F, P);

draw(A--B--C--cycle);
draw(A--D, grey);
draw(B--E, grey);
draw(C--F, grey);
draw(B--Q);
draw(Q--X);
draw(P--X);
draw(c_1, deepcyan);
draw(arc(O_2, abs(O_2-A), -110, 20), deepcyan);

dot("$A$", A, dir(140));
dot("$B$", B, dir(240));
dot("$C$", C, dir(-30));
dot("$H$", H, dir(0));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(0));
dot("$F$", F, dir(160));
dot("$P$", P, dir(-90));
dot("$Q$", Q, dir(-90));
dot("$X$", X, dir(90));

/*
    Source: ISL 2008 G4
    Points: A B C D E F H P Q X
    Item: A E F H X
    Item: B D H F
    Item: C D H E
    Item: B F E C
    Item: A F D C
    Item: B D E A
    Item: P H F Q

    Text: $H$ is the orthocenter.
    Text: $(AFP)$, $(AFQ)$ are tangent to $BC$.
    Text: $X$ is the intersection of $QF$ and $PE$.
*/
