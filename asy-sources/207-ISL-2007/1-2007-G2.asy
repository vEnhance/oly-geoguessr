pair A = dir(90);
pair B = dir(210);
pair C = dir(-30);
pair M = (B+C)/2;
pair N = (A+B)/2;
pair X = N+abs(B-N)*dir(-20);
pair Y = 2*N-X;
pair T = intersectionpoint(M--Y, arc(X, abs(X-B), 120, 220));
pair L = 2*M-T;

draw(A--B--C--cycle, deepcyan);
draw(B--X--T, lightblue);
draw(A--X--M);
draw(A--Y--B);

dot("$A$", A, dir(90));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$M$", M, dir(-90));
dot("$N$", N, dir(140));
dot("$X$", X, dir(0));
dot("$Y$", Y, dir(180));
dot("$T$", T, dir(180));
dot("$L$", L, dir(-30));

/*
    Source: ISL 2007 G2
    Points: A B C M X N Y T L
    Item: A X M B Y
    Item: Y T M L
    Item: X N Y

    Text: $N$ is the midpoint Of $AB$
    Text: $Y$ is the reflection of $X$ over $N$
    Text: $L$ is the reflection of $T$ over $M$
*/
