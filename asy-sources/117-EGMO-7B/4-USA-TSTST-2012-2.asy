pair O_1 = (0, 0);
pair A = dir(80);
pair P = dir(50);
pair B = dir(200);
pair S = dir(-20);
circle c_1 = circle(A, P, B);
pair Q = intersectionpoints(c_1, line(O_1, (A+B)/2))[0];
pair M = intersectionpoints(c_1, line(O_1, (P+S)/2))[1];
pair C = extension(B, S, A, P);
circle c_2 = circle(C, P, Q);
pair O_2 = circumcenter(C, P, Q);
pair D = intersectionpoints(c_2, line(B, P))[1];
pair T = intersectionpoints(c_2, line(B, S))[0];
pair N = intersectionpoints(c_2, line(O_2, (P+T)/2))[1];
pair I = extension(B, M, C, N);

draw(B--C);
draw(B--M);
draw(C--N);
draw(M--N, .8*red);
draw(B--D, deepgreen);
draw(A--C, deepgreen);
draw(O_1--O_2, .8*red);
filldraw(c_1, opacity(0.2)+paleyellow, blue);
filldraw(c_2, opacity(0.2)+paleyellow, blue);

dot("$A$", A, dir(110));
dot("$P$", P, dir(100));
dot("$B$", B, dir(180));
dot("$S$", S, dir(-50));
dot("$Q$", Q, dir(-90));
dot("$M$", M, dir(0));
dot("$C$", C, dir(0));
dot("$D$", D, dir(90));
dot("$T$", T, dir(-120));
dot("$N$", N, dir(180));
dot("$O_1$", O_1, dir(180));
dot("$O_2$", O_2, dir(0));
dot("$I$", I, dir(-90));

/*
    Source: USA TSTST 2012 P2 (7.51)
    Points: A B C D I M N P Q S T O_1 O_2
    Item: P I Q
    Item: B C M N

    Text: $I=BM\cap CN$, $Q=\omega_1\cap \omega_2$
*/
