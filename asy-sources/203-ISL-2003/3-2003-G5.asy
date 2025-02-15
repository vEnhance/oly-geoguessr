pair A = dir(210);
pair B = dir(-30);
pair C = dir(90);
circle u_c = circle(A, B, C);
pair I = incenter(A, B, C);
circle c_1 = circle(A, I, B);
pair N_a = dir(-90);
pair P = N_a+abs(N_a-I)*dir(75);
line p_line1 = parallel(P, line(C, A));
line p_line2 = parallel(P, line(B, C));
line p_line3 = parallel(P, line(A, B));
pair D = intersectionpoint(p_line1, line(A, B));
pair E = intersectionpoint(p_line2, line(A, B));
pair F = intersectionpoint(p_line3, line(A, C));
pair G = intersectionpoint(p_line3, line(B, C));
pair T = extension(F, D, E, G);

draw(F--G);
draw(P--D);
draw(P--E);
draw(F--T);
draw(G--T);
draw(c_1, deepcyan);
draw(A--B--C--cycle);

dot("$A$", A, dir(180));
dot("$B$", B, dir(0));
dot("$C$", C, dir(90));
dot("$I$", I, dir(90));
dot("$P$", P, dir(70));
dot("$D$", D, dir(-110));
dot("$E$", E, dir(-60));
dot("$F$", F, dir(180));
dot("$G$", G, dir(0));
dot("$T$", T, dir(-60));

/*
    Source: ISL 2003 G5
    Points: A B C I P D E F G T
    Item: C P T
    Item: A B C T

    Text: $I$ is the incenter of $\triangle ABC$ with $AC=BC$.
    Text: $P\in (AIB)$ and $PD\parallel AC$, $PE\parallel BC$.
    Text: $T=FD\cap GE$.
*/
