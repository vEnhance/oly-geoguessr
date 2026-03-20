pair O = (0, 0);
pair A = dir(190);
pair B = dir(-10);
pair E = (A+B)/2;
pair C = dir(90);
pair M = dir(-90);
circle u_c = circle(A, B, C);
pair O_1 = (C+E)/2;
pair Z_p = O_1+abs(O_1-C)*dir(60);
circle c_1 = circle(C, E, Z_p);
line tangent1 = tangents(c_1, M)[1];
pair Z = intersectionpoints(c_1, tangent1)[0];
pair P = extension(O_1, Z, A, B);
pair D = intersectionpoints(u_c, line(C, P))[0];
pair F = extension(D, M, A, B);
circle c_2 = circle(Z, D, F);
pair O_2 = circumcenter(D, F, Z);

draw(A--P);
draw(C--P);
draw(u_c, blue);
draw(c_1, lightblue);
draw(c_2, lightblue);

dot("$O$", O, dir(0));
dot("$A$", A, dir(210));
dot("$B$", B, dir(-60));
dot("$C$", C, dir(90));
dot("$E$", E, dir(-50));
dot("$M$", M, dir(-90));
dot("$Z$", Z, dir(180));
dot("$P$", P, dir(0));
dot("$D$", D, dir(30));
dot("$F$", F, dir(-90));
dot("$O_1$", O_1, dir(0));
dot("$O_2$", O_2, dir(-30));

/*
    Source: ELMO Shortlist 2012 (4.46)
    Points: A B C D E F M P Z O O_1 O_2
    Item: D F M
    Item: C F Z
    Item: C D E F
    Item: C E M O O_1
    Item: O_1 O_2 Z P
    Item: O O_2 D

    Text: Those $3$ circles with centers $O$, $O_1$, $O_2$ are tangent to each other in such a say that $C$ is the midpoint of the arc $AB$.
    Text: $M$ is the midpoint of the minor arc $AB$.
*/
