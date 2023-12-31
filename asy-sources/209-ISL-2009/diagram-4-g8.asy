pair reflect(pair P, pair A, pair B) {
    return 2*foot(P, A, B) - P;
}

pair A = dir(10);
pair B = dir(120);
pair C = dir(240);
pair D = dir(300);
pair M = 0.25*(B+3*C); // tsqx expression "(B + 3*C)/4" causes an error
pair N = extension(A, M, C, D);
pair I_1 = incenter(A, B, M);
pair I_2 = incenter(M, N, C);
pair I_3 = incenter(N, D, A);
pair L_1 = reflect(C, I_2, I_3);
pair L_2 = reflect(C, I_3, I_1);
pair L_3 = reflect(C, I_1, I_2);
pair H = extension(A, M, I_3, foot(I_3, I_1, I_2));

draw(D--A--B--C);
draw(N--C--D);
draw(incircle(A, B, M));
draw(incircle(M, N, C));
draw(incircle(N, D, A));
draw(I_1--I_2--I_3--cycle);

dot("$A$", A, dir(A));
dot("$B$", B, dir(B));
dot("$C$", C, dir(C));
dot("$D$", D, dir(D));
dot("$M$", M, plain.SE);
dot("$N$", N, dir(N));
dot("$I_1$", I_1, dir(I_1));
dot("$I_2$", I_2, dir(I_2));
dot("$I_3$", I_3, dir(I_3));
dot("$L_1$", L_1, plain.NW);
dot("$L_2$", L_2, dir(L_2));
dot("$L_3$", L_3, dir(L_3));
dot("$H$", H, dir(H));

/*
    Source: ISL 2009 G8
    Points: A B C D M N I_1 I_2 I_3 L_1 L_2 L_3 H
    Item: N I_2 I_3
    Item: C I_1 I_2 I_3
    Item: I_1 L_2 I_3 H
    Item: I_2 L_3 I_1 H
    Item: I_3 I_2 L_1 H
    Item: A H M L_1 L_3 N
    Text: $ABCD$ is a quadrilateral with an incircle
    Text: $M$ is a point on $BC$ and $N$ is the intersecion of $AM$ and $CD$
    Text: $I_1$, $I_2$, $I_3$ are the incenters of $ABM$, $MNC$, and $NDA$
    Text: $L_1$, $L_2$, $L_3$ are the reflections of $C$ across the sides of triangle $I_1I_2I_3$
    Text: $H$ is the orthocenter of triangle $I_1I_2I_3$
*/
