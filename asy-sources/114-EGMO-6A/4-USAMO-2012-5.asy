pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair P = (0, .1);
pair Q = (-.4, .04);
pair A_1 = 2*foot(A, P, Q)-A;
pair B_1 = 2*foot(B, P, Q)-B;
pair C_1 = 2*foot(C, P, Q)-C;
pair A_p = extension(P, A_1, B, C);
pair B_p = extension(P, B_1, C, A);
pair C_p = extension(P, C_1, A, B);
line gamma = line(P, Q);

draw(u_c, blue);
draw(B--C_p);
draw(A--P--A_p, orange);
draw(B--P--B_p, lightblue);
draw(C--P--C_p, deepgreen);
draw(A--B--C--cycle);
draw(gamma, .8*red);

dot("$A$", A, dir(110));
dot("$B$", B, dir(200));
dot("$C$", C, dir(-20));
dot("$P$", P, dir(60));
dot("$A'$", A_p, dir(-90));
dot("$B'$", B_p, dir(30));
dot("$C'$", C_p, dir(-90));

/*
    Source: USAMO 2012 P5 (6.27)
    Points: A B C P A_p B_p C_p
    Item: A_p B_p C_p
*/
