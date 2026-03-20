pair C = dir(135);
pair A = dir(200);
pair B = dir(-20);
circle u_c = circle(A, B, C);
line tangent1 = tangent(u_c, C);
pair S = intersectionpoint(line(A, B), tangent1);
pair P = S+abs(S-C)*dir(20);
pair M = intersectionpoints(u_c, line(C, P))[0];
pair K = intersectionpoints(u_c, line(A, P))[1];
pair L = intersectionpoints(u_c, line(B, P))[1];
pair T = extension(S, P, M, K);

draw(u_c, blue);
draw(A--S);
draw(K--M);
draw(T--S--C);
draw(A--B--C--cycle);
draw(C--M, dotted+deepgreen);
draw(A--K, dotted+deepgreen);
draw(B--L, dotted+deepgreen);

dot("$A$", A, dir(240));
dot("$B$", B, dir(-60));
dot("$C$", C, dir(110));
dot("$S$", S, dir(180));
dot("$P$", P, dir(80));
dot("$M$", M, dir(-70));
dot("$K$", K, dir(60));
dot("$L$", L, dir(140));
dot("$T$", T, dir(0));

/*
    Source: ISL 2010 G2
    Points: A B C S P K L M T
    Item: C P T K
    Item: B M P T

    Text: $P$ is any point interior of $\triangle ABC$.
    Text: $S=CC\cap AB$, $T=SP\cap KM$.
    Text: $SC=SP$.
*/
