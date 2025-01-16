pair A = (-2, -1);
pair B = (1.5, -1);
pair C = (.14, 1.44);
pair D = (-1.5, .88);
pair O_1 = (A+B)/2;
pair O_2 = (C+D)/2;
circle c_1 = circle(A, B);
circle c_2 = circle(C, D);
pair E = intersectionpoints(c_1, c_2)[0];
pair F = intersectionpoints(c_1, c_2)[1];
pair K_1 = foot(E, A, B);
pair K_2 = foot(F, A, B);
pair K_3 = foot(E, C, D);
pair K_4 = foot(F, C, D);
pair K_5 = foot(E, B, C);
pair K_6 = foot(F, A, D);
circle c_3 = circle(K_1, K_3, K_5);
circle c_4 = circle(K_2, K_4, K_6);
pair X = intersectionpoints(c_3, c_4)[0];
pair Y = intersectionpoints(c_3, c_4)[1];
pair M = (E+F)/2;
pair P = extension(F, K_6, E, K_5);

draw(A--B--C--D--cycle);
draw(c_1, heavycyan);
draw(c_2, heavycyan);
draw(c_3, blue+dotted);
draw(c_4, blue+dotted);
draw(E--K_1, grey);
draw(E--K_3, grey);
draw(E--K_5, grey);
draw(F--K_2, grey);
draw(F--K_4, grey);
draw(F--K_6, grey);
draw(D--K_6);
draw(E--F);

dot("$A$", A, dir(180));
dot("$B$", B, dir(0));
dot("$C$", C, dir(30));
dot("$D$", D, dir(190));
dot("$O_1$", O_1, dir(-90));
dot("$O_2$", O_2, dir(110));
dot("$E$", E, dir(180)*2.0);
dot("$F$", F, dir(30)*1.5);
dot("$K_1$", K_1, dir(-120));
dot("$K_2$", K_2, dir(-60));
dot("$K_3$", K_3, dir(-30));
dot("$K_4$", K_4, dir(85));
dot("$K_5$", K_5, dir(0));
dot("$K_6$", K_6, dir(90));
dot("$X$", X, dir(-90), blue);
dot("$Y$", Y, dir(80), blue);
dot("$M$", M, dir(-90));
dot("$P$", P, dir(90));

/*
    Source: ISL 2011 G3
    Points: A B C D E F O_1 O_2 K_1 K_2 K_3 K_4 K_5 K_6 M P X Y
    Item: X Y M P
    Item: O_1 M O_2
    Item: B K_1 E K_5
    Item: C K_3 E K_5
    Item: A K_6 F K_2
    Item: F K_4 K_6 D
    Item: O_1 K_2 F M
    Item: O_1 K_1 E M
    Item: M F K_4 O_2
    Item: M E K_3 O_2

    Text: $K_i$'s are the respective feet
    Text: $M$ is the midpoint of $EF$
    Text: $O_1$, $O_2$ are the midpoints of $AB$, $CD$ respectively
*/
