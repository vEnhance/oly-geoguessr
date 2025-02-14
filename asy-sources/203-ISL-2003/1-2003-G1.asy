pair A = dir(210);
pair B = dir(130);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair D = intersectionpoints(u_c, line(B, 2*A*C/(A+C)))[0];
pair P = foot(D, B, C);
pair Q = foot(D, A, C);
pair R = foot(D, A, B);

draw(u_c, blue);
draw(A--B--C--D--A);
draw(A--C);
draw(D--P);
draw(D--Q);
draw(D--R);
draw(A--R);

dot("$A$", A, dir(180));
dot("$B$", B, dir(110));
dot("$C$", C, dir(0));
dot("$D$", D, dir(-90));
dot("$P$", P, dir(30));
dot("$Q$", Q, dir(90));
dot("$R$", R, dir(180));

/*
    Source: ISL 2003 G1
    Points: A B C D P Q R
    Item: P Q R
    Item: A Q D R
    Item: C D Q P
    Item: B R D P

    Text: $P$, $Q$, $R$ are the feet of $D\in (ABC)$ on the sides.
*/
