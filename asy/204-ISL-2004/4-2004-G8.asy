pair A = dir(155);
pair B = dir(100);
pair C = dir(-20);
pair D = dir(200);
circle u_c = circle(A, B, C);
pair O = circumcenter(A, B, C);
pair M = (C+D)/2;
pair E = extension(A, C, B, D);
pair F = extension(B, C, A, D);
pair G = extension(A, B, C, D);
circle c_1 = circle(A, B, M);
line tangent1 = tangent(c_1, A);
line tangent2 = tangent(c_1, B);
pair T = intersectionpoint(tangent1, tangent2);
pair N = intersectionpoints(c_1, line(M, T))[1];
pair K = extension(A, B, E, F);
pair P = intersectionpoints(c_1, line(K, M))[1];

draw(u_c, blue);
draw(c_1, deepcyan);
draw(M--P);
draw(A--C);
draw(B--D);
draw(B--F--D--C--B--G--D);

dot("$A$", A, dir(160));
dot("$B$", B, dir(80));
dot("$C$", C, dir(-30));
dot("$D$", D, dir(-120));
dot("$O$", O, dir(-90));
dot("$M$", M, dir(-70));
dot("$E$", E, dir(-80)*1.2);
dot("$F$", F, dir(110));
dot("$G$", G, dir(180));
dot("$N$", N, dir(110));
dot("$K$", K, dir(-10));
dot("$P$", P, dir(180));

/*
    Source: ISL 2004 G8
    Points: A B C D E F G K O M N P
    Item: E F K N
    Item: O M G P
    Item: G N P

    Text: $ABCD$ is cyclic with center $O$, $M$ is the midpoint of $CD$.
    Text: $N\in (ABM)$ such that $\frac{AN}{BN}=\frac{AM}{BM}$.
    Text: $K=AB\cap EF$, $G=AB\cap CD$, $P=KM\cap (ABM)$.
*/
