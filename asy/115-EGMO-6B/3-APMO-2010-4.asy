pair A = dir(110);
pair B = dir(230);
pair C = dir(-50);
circle u_c = circle(A, B, C);
pair H = A+B+C;
pair O = (0, 0);
pair E = foot(B, C, A);
pair F = foot(C, A, B);
pair M = 2*F-B;
pair N = 2*E-C;
pair X = circumcenter(H, M, N);

draw(B--E);
draw(C--F);
draw(u_c, blue);
draw(A--B--C--cycle);
draw(circle(H, M, N), .8*red);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$E$", E, dir(60));
dot("$F$", F, dir(180));
dot("$H$", H, dir(-90));
dot("$M$", M, dir(180));
dot("$N$", N, dir(60));
dot("$O$", O, dir(0));
dot("$X$", X, dir(0));

/*
    Source: APMO 2010 P4 (6.42)
    Points: A B C E F H M N O X
    Item: B C E F
    Item: A E F H
    Item: A C H M
    Item: A B H N
    Item: H O X

    Text: $H$ is the orthocenter of $\triangle ABC$.
    Text: $M$ is the reflection of $B$ over $CF$. Similarly $N$.
    Text: $O$, $X$ are the centers of $(ABC)$, $(HMN)$.
*/
