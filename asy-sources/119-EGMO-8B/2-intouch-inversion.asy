pair A = dir(135);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair O = (0, 0);
pair I = incenter(A, B, C);
pair D = foot(I, B, C);
pair E = foot(I, C, A);
pair F = foot(I, A, B);
pair G_1 = (D+E+F)/3;
pair A_s = (E+F)/2;
pair B_s = (D+F)/2;
pair C_s = (D+E)/2;
pair N = circumcenter(A_s, B_s, C_s);

draw(u_c, blue);
draw(A--B--C--cycle);
draw(D--E--F--cycle);
draw(circle(D, E, F), deepcyan);
draw(circle(A_s, B_s, C_s), lightblue);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$O$", O, dir(180));
dot("$I$", I, dir(0));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(30));
dot("$F$", F, dir(180));
dot("$G_1$", G_1, dir(90));
dot("$A^*$", A_s, dir(90));
dot("$B^*$", B_s, dir(210));
dot("$C^*$", C_s, dir(-10));
dot("$N$", N, dir(-120), lightblue);

/*
    Source: 8.29
    Points: A B C D E F I N O G_1 A_s B_s C_s
    Item: O I N G_1
    Item: A E F I
    Item: B D F I
    Item: C D E I
    Item: A I A_s
    Item: B I B_s
    Item: C I C_s
    Item: D I B_s C_s
    Item: E I A_s C_s
    Item: F I A_s B_s
    Item: D I G_1
    Item: E I G_1
    Item: F I G_1

    Text: $N$ is the nine point center of $\triangle DEF$
*/
