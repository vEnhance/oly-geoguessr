pair A = dir(140);
pair B = dir(90);
pair C = dir(-25);
pair D = dir(205);
circle u_c = circle(A, B, C);
pair E = extension(A, D, B, C);
pair F = extension(A, B, C, D);
circle c_1 = circle(A, E, F);
circle c_2 = circle(C, E, F);
pair G = intersectionpoints(u_c, c_1)[0];
pair H = intersectionpoints(u_c, c_2)[1];
pair R = extension(A, C, B, D);
pair K = extension(E, F, H, C);
pair O_1 = circumcenter(A, E, F);

draw(u_c, blue);
draw(F--K--C, deepcyan);
draw(B--E--D--C--B--F--D);
draw(arc(O_1, abs(O_1-E), -125, 30), lightblue);
draw(c_2, lightblue);
draw(A--C);
draw(B--D);

dot("$A$", A, dir(140));
dot("$B$", B, dir(60));
dot("$C$", C, dir(-50));
dot("$D$", D, dir(230));
dot("$E$", E, dir(120));
dot("$F$", F, dir(230));
dot("$G$", G, dir(180));
dot("$H$", H, dir(0));
dot("$K$", K, dir(90));
dot("$R$", R, dir(20));

/*
    Source: ELMO Shortlist 2014 (9.56)
    Points: A B C D E F G H K R
    Item: A K G
    Item: G H R

    Text: $K=EF\cap CH$, $R=AC\cap BD$
*/
